# Protocolo Orbit OBM 📡

## Envelope de Resposta
```json
{
  "status": "success|error",
  "data": { /* payload */ },
  "error": { "code": "string", "message": "string", "details": {} },
  "meta": { "version": "v1", "traceId": "uuid", "timestamp": "ISO" }
}
```

## Erros Padronizados
- `AUTH_INVALID_CREDENTIALS` (401)
- `AUTH_TOKEN_EXPIRED` (401)
- `AUTH_FORBIDDEN` (403)
- `VALIDATION_ERROR` (422)
- `NOT_FOUND` (404)
- `RATE_LIMITED` (429)
- `INTERNAL_ERROR` (500)

## Regras
- Versionamento por caminho (`/api/v1/...`).
- `traceId`/correlation para observabilidade.
- Paginação `page`/`pageSize`, `total` em `meta`.
- Idempotência para POST críticos (chave `Idempotency-Key`).
- Headers de rate limit (`X-RateLimit-Remaining`).

## Segurança
- [[06-Glossario-Tecnico/JWT]] para autenticação; expiração e refresh.
- [[06-Glossario-Tecnico/RBAC]] para autorização por papel.
- HTTPS obrigatório; TLS configurado (ver [[06-Glossario-Tecnico/HTTPS]]).
- Secrets em `.env`/secret manager (ver [[06-Glossario-Tecnico/Secrets]]).
- Webhooks com assinatura/verificação (ver [[06-Glossario-Tecnico/Webhooks]]).

## Padrões de Request
- Content-Type: `application/json`.
- Campos com nomes consistentes (`snake_case` ou `camelCase` definido por stack).
- Validação por DTO/schemas com mensagens claras.

> [!tip] Aplicação
> Todos os módulos `obm-*` devem adotar este protocolo para interoperabilidade e suporte a auditoria.