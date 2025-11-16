# Starter: NestJS + Prisma + BullMQ

## Conteúdo
- API NestJS com módulos base (auth/example).
- ORM Prisma (Postgres) e filas BullMQ (Redis).
- Dockerfile e docker-compose com Postgres/Redis.
- `.env.example` com variáveis padrão.

## Como usar
- Copie esta pasta para seu serviço.
- Ajuste `.env` e rode `docker-compose up -d`.
- Execute `pnpm install && pnpm prisma migrate dev && pnpm start:dev`.

## Variáveis
- `DATABASE_URL`, `REDIS_URL`, `JWT_SECRET`, `JWT_EXPIRES_IN`.