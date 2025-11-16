# Deploy Providers (Vercel/Railway/Render) 🚀

## Vercel (Next.js)
- Configurar envs e secrets (JWT_SECRET, BASE_URL).
- Health checks via middleware ou endpoint.

## Railway (APIs NestJS/FastAPI)
- Projeto com Dockerfile; serviços Postgres/Redis.
- Env vars e volumes; health checks.

## Render
- Docker; persistência para Postgres.
- Health checks; auto-redeploy.

## Checklists
- Secrets fora do código; observabilidade habilitada.
- Readiness/liveness; rollback; escalabilidade.