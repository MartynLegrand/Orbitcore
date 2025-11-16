# Playbook de Testes (SDKs e Módulos)

## SDKs
- Unit: métodos principais, erros e reintentos.
- Integração: contra API local (compose base).

## Módulos
- e2e: endpoints críticos, contratos e códigos.
- Idempotência: `Idempotency-Key` e duplicidades.
- Paginação: `page/pageSize/total`.

## CI
- Pipeline executa unit + e2e e publica artefatos.