#!/usr/bin/env bash
set -euo pipefail
# Wrapper simples: delega ao PowerShell no Windows ou usa tarefas dummy
if command -v pwsh >/dev/null 2>&1; then
  pwsh -File scripts/autorun.ps1
else
  echo "Autorun shell: ajuste para sua plataforma (requer parsing JSON)."; exit 0
fi