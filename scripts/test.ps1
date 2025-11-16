$ErrorActionPreference = "Stop"

function Check-Url($url) {
  $r = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 5
  if ($r.StatusCode -ne 200) { throw "Falha: $url" }
}

Check-Url "http://localhost:3001/health"
Check-Url "http://localhost:3002/health"
Check-Url "http://localhost:3003/health"
Write-Host "Health checks OK"