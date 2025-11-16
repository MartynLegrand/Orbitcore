# Catálogo de Entregáveis 📦

## ARCHITECTURE.md
- Visão macro, módulos OBM, fluxos e boundaries (REST/gRPC/FFI/WASM).
- Diagramas e decisões.

## API_CONTRACT.md
- Endpoints, request/response (Protocolo Orbit OBM), erros padronizados.
- Versionamento (`/api/v1`), paginação, idempotência.

## DATA_MODEL.md
- Entidades, relações, constraints e migrações.
- Compatível com [[06-Glossario-Tecnico/Prisma]].

## SDK.md
- Métodos, argumentos e retornos (TS/Python).
- Segue [[02-Guia-para-Devs/05-Templates-SDK-TS-Python]].

## ORCHESTRATION.md
- Eventos (tipos, payloads), sagas, compensações.
- Filas ([[06-Glossario-Tecnico/BullMQ]]), idempotência e retries.

## INTEGRATIONS.md
- Conexões externas (providers, webhooks) e segurança.
- Assinaturas e proteção contra replay.

## SECURITY_COMPAT.md
- JWT, RBAC, HTTPS, Secrets; conformidade e auditoria.
- Checklists de [[07-Receitas-e-Playbooks/03-Checklist-Seguranca]].

## TESTING.md
- Testes unit/e2e, mocks e cenários críticos.
- Critérios de aceitação.

## OBSERVABILITY.md
- Logs, métricas e tracing; health checks.
- Dashboards e alertas.

## DEPLOY.md
- Docker/Compose, envs e secrets; opções Railway/Render/Vercel.
- Evolução para [[06-Glossario-Tecnico/Kubernetes]].