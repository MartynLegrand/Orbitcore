# Checklist de Segurança 🔐

- Secrets em `.env`/secret manager (nunca hardcode).
- Autenticação [[06-Glossario-Tecnico/JWT]] e autorização [[06-Glossario-Tecnico/RBAC]].
- Validação de input (DTO/schemas) e sanitização.
- Rate limits, proteção contra brute force.
- Logs seguros (sem dados sensíveis).
- Segurança de webhooks (assinaturas e replay protection).