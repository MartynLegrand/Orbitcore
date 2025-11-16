Param(
  [string]$ConfigFile = "infra/autorun.config.json",
  [string]$StateFile = "infra/tasks.state.json",
  [string]$TransitionsFile = "logs/transitions.json",
  [string]$LogFile = "logs/autorun.log",
  [string]$MetricsFile = "logs/metrics.json"
)

$ErrorActionPreference = "Stop"

function Ensure-Files {
  if (-not (Test-Path "logs")) { New-Item -ItemType Directory -Path "logs" | Out-Null }
  if (-not (Test-Path $TransitionsFile)) { '{"transitions":[]}' | Out-File -Encoding UTF8 $TransitionsFile }
  if (-not (Test-Path $StateFile)) { '{"current":null,"entries":[]}' | Out-File -Encoding UTF8 $StateFile }
  if (-not (Test-Path $LogFile)) { New-Item -ItemType File -Path $LogFile | Out-Null }
  if (-not (Test-Path $MetricsFile)) { '{"tasks_ready":0,"tasks_in_progress":0,"tasks_failed":0,"tasks_completed":0}' | Out-File -Encoding UTF8 $MetricsFile }
}

function Load-Json($path) { Get-Content $path -Raw | ConvertFrom-Json }
function Save-Json($obj, $path) { ($obj | ConvertTo-Json -Depth 6) | Out-File -Encoding UTF8 $path }

function Get-CpuAvg {
  try { (Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average).Average }
  catch { return 0 }
}

function Score-Task($t) {
  $urg = [int]$t.urgency; $imp = [int]$t.importance
  $deadline = [datetime]$t.deadline
  $now = Get-Date
  $days = [math]::Max(0, ($deadline - $now).TotalDays)
  $deadlineScore = if ($days -le 1) { 10 } elseif ($days -le 3) { 7 } elseif ($days -le 7) { 5 } else { 2 }
  return ($urg * 0.5 + $imp * 0.4 + $deadlineScore * 0.1)
}

function Can-Start($t, $all) {
  foreach ($dep in $t.dependencies) {
    $d = $all | Where-Object { $_.id -eq $dep }
    if ($null -eq $d -or $d.status -ne 'completed') { return $false }
  }
  return $true
}

function Pick-Next($tasks) {
  $candidates = $tasks | Where-Object { $_.status -eq 'pending' }
  $scored = @()
  foreach ($t in $candidates) { $scored += [pscustomobject]@{ task = $t; score = (Score-Task $t) } }
  ($scored | Sort-Object score -Descending | Select-Object -First 1).task
}

function Log($msg) { $time = (Get-Date).ToString('s'); Add-Content -Path $LogFile -Value "[$time] $msg" }

function Record-Transition($fromId, $toId, $status) {
  $trans = Load-Json $TransitionsFile
  $entry = [pscustomobject]@{ timestamp = (Get-Date).ToString('s'); from = $fromId; to = $toId; status = $status }
  $trans.transitions += $entry
  Save-Json $trans $TransitionsFile
}

function Start-Task($task) {
  Log "Start task: $($task.id)"
  $state = Load-Json $StateFile
  $state.current = $task.id
  $entry = [pscustomobject]@{ id = $task.id; startedAt = (Get-Date).ToString('s'); pid = $null; status = 'in_progress' }
  $state.entries = @($state.entries + $entry)
  Save-Json $state $StateFile

  foreach ($cmd in $task.commands) {
    if ($cmd.shell -eq 'powershell') {
      $psi = New-Object System.Diagnostics.ProcessStartInfo
      $psi.FileName = 'powershell'
      $psi.Arguments = "-NoProfile -Command \"$($cmd.run)\""
      $psi.RedirectStandardOutput = $true
      $psi.RedirectStandardError = $true
      $psi.UseShellExecute = $false
      $p = New-Object System.Diagnostics.Process
      $p.StartInfo = $psi
      $null = $p.Start()
      $p.WaitForExit()
      if ($p.ExitCode -ne 0) { throw "Task $($task.id) failed: $($p.StandardError.ReadToEnd())" }
    } else { throw "Unsupported shell: $($cmd.shell)" }
  }
}

function Complete-Task($task) {
  $task.status = 'completed'
  Log "Completed task: $($task.id)"
}

function Fail-Task($task, $reason) {
  $task.status = 'failed'
  Log "Failed task: $($task.id) - $reason"
  $note = "- $(Get-Date -Format s) Falha ao iniciar/rodar tarefa $($task.id): $reason"
  Add-Content -Path "logs/notifications.md" -Value $note
}

Ensure-Files
$config = Load-Json $ConfigFile
$shards = @()
foreach ($s in $config.shards) { if (Test-Path $s) { $shards += (Load-Json $s) } }
$tasks = @()
foreach ($q in $shards) { $tasks += $q.tasks }

$CpuThreshold = [int]$config.cpuThreshold
$maxConcurrent = [int]$config.maxConcurrent

function Update-Metrics($deltaReady,$deltaInProgress,$deltaFailed,$deltaCompleted) {
  $m = Load-Json $MetricsFile
  $m.tasks_ready += $deltaReady
  $m.tasks_in_progress += $deltaInProgress
  $m.tasks_failed += $deltaFailed
  $m.tasks_completed += $deltaCompleted
  Save-Json $m $MetricsFile
}

$running = @()

while ($true) {
  $cpu = Get-CpuAvg
  if ($cpu -ge $CpuThreshold) { Log "CPU alto ($cpu%). Aguardando..."; Start-Sleep -Seconds 5; continue }

  # iniciar novas tasks se abaixo do limite de concorrência
  while (($running.Count -lt $maxConcurrent)) {
    $next = Pick-Next $tasks
    if ($null -eq $next) { break }
    if (-not (Can-Start $next $tasks)) { Fail-Task $next "Dependências não concluídas"; Record-Transition $null $next.id 'failed'; Update-Metrics 0,0,1,0; continue }
    try {
      Log "Start task: $($next.id)"
      $state = Load-Json $StateFile
      $state.current = $next.id
      $state.entries = @($state.entries + [pscustomobject]@{ id = $next.id; startedAt = (Get-Date).ToString('s'); status = 'in_progress' })
      Save-Json $state $StateFile
      $cmd = $next.commands[0]
      $psi = New-Object System.Diagnostics.ProcessStartInfo
      $psi.FileName = 'powershell'
      $psi.Arguments = "-NoProfile -Command \"$($cmd.run)\""
      $psi.RedirectStandardOutput = $true
      $psi.RedirectStandardError = $true
      $psi.UseShellExecute = $false
      $p = New-Object System.Diagnostics.Process
      $p.StartInfo = $psi
      $null = $p.Start()
      $running += [pscustomobject]@{ id = $next.id; proc = $p; retries = 0 }
      $next.status = 'in_progress'
      Update-Metrics (-1), 1, 0, 0
    } catch {
      Fail-Task $next $_.Exception.Message
      Record-Transition $null $next.id 'failed'
      Update-Metrics 0,0,1,0
    }
  }

  # verificar conclusões/falhas
  for ($i = $running.Count - 1; $i -ge 0; $i--) {
    $r = $running[$i]
    if ($r.proc.HasExited) {
      $task = ($tasks | Where-Object { $_.id -eq $r.id })
      if ($r.proc.ExitCode -eq 0) {
        Complete-Task $task
        Record-Transition $null $task.id 'completed'
        Update-Metrics 0, (-1), 0, 1
        $running.RemoveAt($i)
      } else {
        $taskRetries = $r.retries + 1
        if ($taskRetries -le $config.retryPolicy.maxRetries) {
          Log "Retry task: $($task.id) ($taskRetries)"
          $delay = $config.retryPolicy.initialDelaySeconds * [math]::Pow($config.retryPolicy.factor, ($taskRetries - 1))
          Start-Sleep -Seconds $delay
          $cmd = $task.commands[0]
          $psi = New-Object System.Diagnostics.ProcessStartInfo
          $psi.FileName = 'powershell'
          $psi.Arguments = "-NoProfile -Command \"$($cmd.run)\""
          $psi.RedirectStandardOutput = $true
          $psi.RedirectStandardError = $true
          $psi.UseShellExecute = $false
          $p2 = New-Object System.Diagnostics.Process
          $p2.StartInfo = $psi
          $null = $p2.Start()
          $running[$i] = [pscustomobject]@{ id = $task.id; proc = $p2; retries = $taskRetries }
        } else {
          Fail-Task $task "Max retries reached"
          $dlq = Load-Json "infra/tasks.dlq.json"
          $dlq.entries += [pscustomobject]@{ id = $task.id; failedAt = (Get-Date).ToString('s'); reason = 'Max retries' }
          Save-Json $dlq "infra/tasks.dlq.json"
          Record-Transition $null $task.id 'failed'
          Update-Metrics 0, (-1), 1, 0
          $tasks = $tasks | Where-Object { $_.id -ne $task.id }
          $running.RemoveAt($i)
        }
      }
    }
  }

  Start-Sleep -Seconds 3
}

Log "Autorun finalizado"