# RULES GLOBAL

## 1. Nomenclatura e Placeholders
- Módulos reutilizáveis devem usar o prefixo `obm-*`.
- Nunca usar prefixo “martyn” em nomes de módulos.
- Apps devem ser citados via placeholders: `{{APP_AUTH_SOCIAL}}`, `{{APP_3D_CORE}}`, `{{APP_ORBIT_SUITE}}`, `{{APP_MUSIC_PLATFORM}}`.

## 2. Contratos e Integração
- Todo módulo deve definir claramente: entradas, saídas, erros padronizados e APIs/SDKs.
- Preferir integração via `REST` entre linguagens diferentes; usar packages/libs quando na mesma linguagem.
- Documentar endpoints, formatos de request/response e códigos de erro.

## 3. Segurança
- Nunca hardcode secrets; usar `.env` ou secret manager.
- Padronizar autenticação por [[Glossario-Tecnico/JWT]] onde houver login.
- Validar inputs (DTOs/schemas), aplicar RBAC ([[Glossario-Tecnico/RBAC]]), rate limits e logs seguros.

## 4. Linkagem e Navegação
- Todo termo técnico vira um wikilink para `06-Glossario-Tecnico/...`.
- Manter navegação bidirecional entre conceitos relacionados e notas de módulos.

## 5. Fonte da Verdade e Aprovação
- Nunca adaptar, excluir ou reescrever documentação sem autorização explícita após leitura da nova fonte.
- Antes de incluir/excluir regras, solicitar aprovação.

## 6. Stack Fixa
- Stack oficial: NestJS (TS), FastAPI (Python), Next.js (React), Postgres, Redis, Docker.
- ORM oficial para NestJS + Postgres: [[06-Glossario-Tecnico/Prisma]].
- Fila/Jobs assíncronos: [[06-Glossario-Tecnico/BullMQ]] (Redis).
- Módulos de alta performance (quando necessário): Rust/Go/C++ com fronteiras [[06-Glossario-Tecnico/gRPC]], [[06-Glossario-Tecnico/FFI]] e [[06-Glossario-Tecnico/WebAssembly]].
- Módulos devem preferir padrões idiomáticos dessas stacks.

## 7. Conversão de Open-Source para Nossa Stack
- Conservar contratos (APIs/SDKs) e requisitos de segurança.
- Portar componentes para padrões `obm-*` com camadas de adaptação quando necessário.
- Documentar diferenças e testes de compatibilidade.

## 8. Ignore/Index e Docx
- Configurar arquivos ignorados do índice (logs, binários, cache, builds).
- Habilitar ingestão de `.docx` com conversão para `.md` quando aplicável.
- Manter os índices limpos e atualizados.

## 9. Cache Hygiene
- Ao atualizar documentação, limpar/otimizar caches relevantes.
- Registrar a operação e impactos se houver.

## 10. Validação e Confiabilidade
- Toda instrução deve vir com método de verificação e avisos de armadilhas.
- Nunca sugerir abordagens que possam levar a falhas.

## 11. Prompts de Auto-Limpeza e Plugins
- Auto-limpeza: verificar wikilinks quebrados, remover arquivos órfãos, otimizar imagens, reconstruir índices.
- Plugins recomendados: Dataview, Templater, Advanced Tables, Mermaid. Documentar configuração.

## 12. Regras para Tasks (Trae)
- `.task` é uma unidade atômica com objetivo claro, entradas e saídas.
- Criar tasks paralelas quando independentes (ingestão, glossário, scaffold, receitas, histórico).
- Cada task deve reportar progresso, lacunas e propostas.

> [!warning] Aprovação Obrigatória
> Qualquer alteração nas RULES GLOBAL requer aprovação explícita do responsável pelo projeto.