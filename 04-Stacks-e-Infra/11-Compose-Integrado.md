ndo a ia teminar para a terefa que falata mais # Compose Integrado OBM

## Arquivos
- `infra/compose.obm.integrated.yml`
- `infra/.env.example`
- `scripts/bootstrap.ps1`

## Uso
- Windows: copiar `infra/.env.example` para `infra/.env` e executar `scripts/bootstrap.ps1`.
- Linux/macOS: usar `make bootstrap` (ou `scripts/bootstrap.sh`).
- Verificar health em `http://localhost:3001/health`, `:3002/health`, `:3003/health`.

## Serviços
- obm-auth (3001), obm-payments (3002), obm-notifications (3003), Postgres (5432), Redis (6379).

## Observabilidade
- Integrar com dashboards em `observability/dashboards/*.json`.