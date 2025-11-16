# CI/CD – Pipeline Mínimo 🔁

## Objetivos
- Garantir qualidade automatizada (lint, testes, build).
- Produzir artefato Docker e publicar.

## Etapas (exemplo)
1. Checkout e instalação
2. Lint/Format
3. Testes (unit/e2e)
4. Build
5. Docker build & push
6. Deploy (manual ou automático)

## Exemplo (pseudo-config)
```yaml
name: ci
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - run: npm ci
      - run: npm run lint && npm run test && npm run build
      - run: docker build -t obm/api:$(git rev-parse --short HEAD) .
      - run: echo "$REGISTRY_PASS" | docker login -u "$REGISTRY_USER" --password-stdin
      - run: docker push obm/api:$(git rev-parse --short HEAD)
```

> [!tip] Adapte
> Configure secrets (REGISTRY_USER/PASS) no provedor de CI e integre com ambientes (Railway/Render/Vercel/K8s).
