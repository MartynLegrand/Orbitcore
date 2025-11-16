# Stack Oficial OBM/Orbit 🌐

## Componentes
- Backend: NestJS (TypeScript) [[06-Glossario-Tecnico/REST]].
- Backend: FastAPI (Python) [[06-Glossario-Tecnico/REST]].
- Frontend: Next.js (React).
- Banco: Postgres (ORM: [[06-Glossario-Tecnico/Prisma]]).
- Cache/Mensageria: Redis (Fila: [[06-Glossario-Tecnico/BullMQ]]).
- Entrega: Docker/Compose [[06-Glossario-Tecnico/Docker]]; Deploy: Vercel/Railway/Render.

## Padrões
- Contratos claros entre módulos `obm-*`.
- JWT + RBAC por padrão ([[06-Glossario-Tecnico/JWT]], [[06-Glossario-Tecnico/RBAC]]).
- Testes mínimos, [[06-Glossario-Tecnico/CI-CD]] e observabilidade.

## Módulos de Alta Performance
- Linguagens: Rust/C++/Go para processamento intensivo.
- Boundary principal: [[06-Glossario-Tecnico/gRPC]]. Secundários: [[06-Glossario-Tecnico/FFI]] e [[06-Glossario-Tecnico/WebAssembly]].
- Padrões: limites claros, contratos estáveis, segurança e telemetria.


