Param(
  [string]$ComposeFile = "infra/compose.obm.integrated.yml",
  [string]$EnvFile = "infra/.env"
)

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) { Write-Error "Docker não encontrado"; exit 1 }
if (-not (Test-Path $EnvFile)) { Copy-Item "infra/.env.example" $EnvFile }

docker compose -f $ComposeFile up -d

function Wait-Health($url) {
  $max=30; $i=0
  while ($i -lt $max) { try { $r=Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 3; if ($r.StatusCode -eq 200) { return } } catch {} ; Start-Sleep -Seconds 2; $i++ }
  throw "Healthcheck falhou: $url"
}

Wait-Health "http://localhost:3001/health"
Wait-Health "http://localhost:3002/health"
Wait-Health "http://localhost:3003/health"
Write-Host "Ambiente integrado pronto"