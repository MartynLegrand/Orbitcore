# Compose Base 🐳

## Serviços
```yaml
version: '3.9'
services:
  api:
    image: obm/api:local
    build: ./api
    env_file: .env
    depends_on:
      - postgres
      - redis
    ports:
      - "3000:3000"
  postgres:
    image: postgres:16
    environment:
      POSTGRES_USER: obm
      POSTGRES_PASSWORD: obm
      POSTGRES_DB: obm
    ports:
      - "5432:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data
  redis:
    image: redis:7
    ports:
      - "6379:6379"
volumes:
  pgdata:
```

## .env (exemplo)
```
DB_URL=postgresql://obm:obm@localhost:5432/obm
REDIS_URL=redis://localhost:6379
JWT_SECRET=change_me
JWT_EXPIRES_IN=86400
PAYMENTS_PROVIDER_KEY=...
WEBHOOK_SECRET=...
```

> [!warning] Ajuste
> Alinhe variáveis conforme cada módulo `obm-*` e segredos via secret manager em produção.
