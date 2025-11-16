# Playbook de Auditoria Automática 🔍

## Objetivo
- Verificar consistência da documentação e contratos.

## Checks
- Wikilinks válidos; ausência de links quebrados.
- Contratos v1 completos (endpoints, schemas, erros, idempotência).
- Segurança presente (JWT/RBAC/HTTPS/Secrets/Webhooks).
- Observabilidade (logs, métricas, tracing, health).
- SDKs atualizados e publicados.

## Saída
- Relatório com faltas e sugestões de correção por módulo.

## Tasks
- Auditoria de links.
- Auditoria de contratos.
- Auditoria de segurança.
- Auditoria de observabilidade.
- Auditoria de SDKs/publicação.