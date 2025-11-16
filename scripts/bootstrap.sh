 prossiga quando e#!/usr/bin/env bash
set -euo pipefail
COMPOSE=${COMPOSE:-infra/compose.obm.integrated.yml}
ENVFILE=${ENVFILE:-infra/.env}

if ! command -v docker >/dev/null 2>&1; then echo "Docker not found"; exit 1; fi
[ -f "$ENVFILE" ] || cp infra/.env.example "$ENVFILE"

docker compose -f "$COMPOSE" up -d

wait_health() {
  local url="$1"; local max=30
  for i in $(seq 1 $max); do
    if curl -fsS "$url" >/dev/null; then return 0; fi
    sleep 2
  done
  echo "Healthcheck failed: $url"; exit 1
}

wait_health "http://localhost:3001/health"
wait_health "http://localhost:3002/health"
wait_health "http://localhost:3003/health"
echo "Integrated environment ready"