# CI + Publish SDKs

## Objetivo
- Executar testes e publicar SDKs (npm/PyPI) com segurança.

## Pipeline
- Checkout → Bootstrap Compose → Health → Tests → Build SDKs → Publish.

## Regras
- Semver e changelog; tags para releases.
- Secrets configurados no provider (registry tokens).
- Protocolo [[00-Config/05-Protocolo-Orbit-OBM]] respeitado.