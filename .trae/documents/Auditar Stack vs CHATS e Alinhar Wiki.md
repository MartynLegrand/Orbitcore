## Correções Necessárias

* Remover “Martyn” de toda a nomenclatura e documentos; usar Orbit/OBM exclusivamente.

* Confirmar e registrar que a stack é universal: Node/TS + Python como base, Rust/C++/Go para módulos de alta performance.

* Incluir diretrizes de integração multi‑linguagem (REST/gRPC, FFI C ABI, WebAssembly, filas) entre módulos.

## Leitura e Reconciliação

* Ler o arquivo de chats inteiro em blocos e mapear evoluções de decisões.

* Extrair evidências de: stack, segurança, protocolos, repositório, agentes e nomeclatura.

* Construir um relatório de mudanças aprovadas pelas conversas.

## Atualizações Planejadas

* Renomear “Stack Oficial Martyn” para “Stack Oficial OBM/Orbit” em todos os arquivos e referências.

* Atualizar “Stacks e Infra” com:

  * Prisma como ORM oficial para NestJS + Postgres.

  * BullMQ (Redis) como fila padrão.

  * Opções de deploy (Railway/Render/Vercel) mantendo Docker obrigatório.

  * Seção “Módulos de Alta Performance”: Rust/C++/Go e padrões de boundary (gRPC/FFI/WASM).

* Regras Globais:

  * Proibir uso de “Martyn” (nomes de módulos, docs e placeholders).

  * Reforçar placeholders de apps e padrão `obm-*`.

* Protocolos:

  * Renomear “Protocolo Martyn/Orbit” para “Protocolo Orbit OBM”.

  * Garantir envelope, versionamento, traceId, idempotência, rate limits.

* Arquitetura de Repositório:

  * Documentar `platform/core (gateway-api, shared-kernel, dev-tools)`, `modules/*` (service, sdk-js, sdk-py, docs) e `apps/*`, conforme os chats.

* Glossário: adicionar notas para `Prisma`, `BullMQ`, `gRPC`, `FFI`, `WebAssembly`, `FTS/Elasticsearch`, `S3/Storage`, `CI/CD`.

## Validações

* Checagem de wikilinks e consistência dos placeholders.

* Revisão de segurança (JWT, RBAC, HTTPS, Secrets, Webhooks).

* Relatório final de evidências (linhas do arquivo) que sustentam cada alteração.

## Aprovação Solicitada

* Executar renomeações e atualizações acima.

* Incluir glossários novos e reforçar a stack universal com Rust/C++/Go.

* Aplicar a regra de exclusão total de “Martyn” na nomenclatura e documentação.

