# Arquitetura de Repositório 🗂️

## Estrutura
```
platform/
  core/
    gateway-api/       # BFF / API Gateway
    shared-kernel/     # Tipos e contratos compartilhados
    dev-tools/         # CLIs, templates
  modules/
    auth/
      service/
      sdk-js/
      sdk-py/
      docs/
    chat/
    orchestrator/
    payments/
    notifications/
  apps/
    app-orbit/
    app-auth-social/
    app-3d-core/
```

## Diretrizes
- Cada módulo com service, SDKs (JS/Py) e docs.
- Core com gateway, kernel e ferramentas.
- Apps usam placeholders e integram módulos OBM.