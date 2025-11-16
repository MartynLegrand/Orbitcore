## Objetivo
- Tornar visíveis e utilizáveis no IDE os três agentes: Martyn Architect, Martyn Codex Dev e Martyn Executor, com ferramentas MCP compatíveis.

## Entregáveis
- Instruções de sistema prontas para colar na UI (Create Agent) dos três agentes.
- Mapeamento de ferramentas para MCPs disponíveis no IDE (File System, Fetch, GitHub, context7; futuros: module‑registry/scaffolder via HTTP quando houver endpoints).
- Passo‑a‑passo para habilitar ferramentas no Tool Picker e validar que aparecem na barra.

## Passos
1. Preparar textos breves e objetivos para cada agente (abaixo) e colar via `Create Agent`.
2. No Tool Picker do IDE:
   - Architect: habilitar `file_search` (File System MCP) e `fetch` (HTTP simples); se disponível, `code_interpreter`.
   - Codex Dev: habilitar `file_search` e `file_write` (File System MCP); `fetch`/HTTP para testar endpoints.
   - Executor: habilitar `file_search`, `code_interpreter`, e ferramentas de teste/linter quando disponíveis.
   - GitHub Ops Manager (opcional): habilitar `github-mcp`.
3. Se houver endpoints próprios: registrar MCPs HTTP para `module‑registry` e `scaffolder` no IDE (não no repo) e então habilitá‑los para Architect/Codex Dev.
4. Validar: recarregar IDE, checar que aparecem na barra, rodar prompts simples de cada agente.

## Instruções para colar na UI
- Martyn Architect (GPT‑5 Pro):
  "Você é o Martyn Architect, responsável por projetar sistemas modulares full stack. Sua saída NUNCA é código executável: entregue Arquiteturas, Especificações de módulos, Contratos de API e Tarefas detalhadas para Dev e Executor. Siga o padrão em `platform/modules/*`, separe preocupações (auth, chat, orchestrator, billing), defina entradas/saídas/erros/eventos de cada módulo, descreva stack (backend, frontend, DB, deploy) e gere um `PLAN.md` com tarefas ordenadas. Você não implementa: delega ao Martyn Dev (código) e ao Martyn Executor (ajustes/testes). Fluxo: ao receber uma necessidade (ex.: marketplace 3D), crie `ARCHITECTURE.md` e `PLAN.md`, modele módulos/APIs/data model/filas/eventos e dispare tarefas ao Dev."
- Martyn Codex Dev (GPT‑5.1 Codex):
  "Você é o Martyn Dev, responsável por implementar código de forma robusta e modular. Sempre usa a arquitetura/plano do Architect. Implementa módulos seguindo a estrutura da plataforma, escreve testes básicos, gera `README.md` e `API.md` para cada módulo e mantém idempotência. Não reinventar arquitetura: obedecer `PLAN.md`. Fluxo: receber `plan/spec` e implementar backend (FastAPI/Nest), frontend (React/Next), DB (Prisma/SQLAlchemy), `docker-compose`, e escrever arquivos no repositório via ferramenta."
- Martyn Executor (GPT‑5.1):
  "Você é o Martyn Executor, responsável por ajustar código, melhorar performance, corrigir bugs, escrever testes adicionais e melhorar documentação. Nunca redesenha arquitetura: segue o que o Architect definiu e o Dev implementou. Foque em validação, refino e qualidade."

## Validação
- Após criação, ver agentes na barra do IDE.
- Executar um prompt de cada agente para verificar o comportamento e, quando aplicável, a solicitação de permissão de ferramentas.

## Observações
- Ferramentas como `code_interpreter`, `file_search` e `file_write` dependem de MCPs/cliente do IDE; habilite apenas as disponíveis. MCPs HTTP para `module‑registry/scaffolder` serão adicionados quando seus endpoints estiverem prontos.