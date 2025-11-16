#!/usr/bin/env bash
set -euo pipefail

check() { curl -fsS "$1" >/dev/null || { echo "Fail: $1"; exit 1; }; }
check "http://localhost:3001/health"
check "http://localhost:3002/health"
check "http://localhost:3003/health"
echo "Health checks OK"