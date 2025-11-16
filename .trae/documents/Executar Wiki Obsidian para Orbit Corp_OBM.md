## Objetivos
- Consolidar conversas, arquivos e referências em uma wiki Obsidian navegável.
- Padronizar arquitetura modular OBM (módulos plugáveis, SDKs, contratos de API).
- Criar glossário técnico interligado e “livro de receitas” anti-erros.
- Documentar fluxos de trabalho com IAs e tarefas paralelas.
- Estabelecer RULES GLOBAL com aprovação para alterações.

## Entregáveis
- Vault Obsidian estruturado em múltiplos `.md` com wikilinks.
- Placeholders de apps e convenções de nomenclatura `obm-*`.
- Notas por módulo OBM (auth, chat, orchestrator, payments, etc.).
- Glossário completo com exemplos, prompts e links.
- Playbooks de desenvolvimento, segurança e escalabilidade.
- Receitas de prompts para Agents e tarefas paralelas (Trae).
- Linha do tempo e histórico de decisões.

## Estrutura do Vault
- `00-Config/` (Placeholders, Mapa do Ecossistema, Como Usar).
- `01-Visao-Geral/` (Resumo estratégico, Produtos, Visão dos módulos OBM).
- `02-Guia-para-Devs/` (Criar módulo OBM, conectar ao core, usar IA, fluxo de dev).
- `03-Modulos-OBM/` (um arquivo por módulo principal).
- `04-Stacks-e-Infra/` (Stack Oficial, NestJS, FastAPI, Next.js, Postgres/Redis, Docker).
- `05-IA-e-Agents/` (Arquitetura de Agents e receitas de prompt).
- `06-Glossario-Tecnico/` (uma nota por termo técnico relevante).
- `07-Receitas-e-Playbooks/` (receitas, checklists, Guia Anti-Erros).
- `08-Referencias-Externas/` (links, starters, 3D/render).
- `99-Log-e-Historico/` (linha do tempo e histórico de ideias).

## Convenções e Placeholders
- Prefixo obrigatório `obm-` para módulos reutilizáveis.
- Placeholders de apps: `{{APP_AUTH_SOCIAL}}`, `{{APP_3D_CORE}}`, `{{APP_ORBIT_SUITE}}`, `{{APP_MUSIC_PLATFORM}}`.
- Arquivo inicial: `00-Config/00-Placeholders.md` mapeando placeholders → nomes atuais.
- Todos os apps citados na documentação devem usar placeholders.

## Fontes e Ingestão
- Ler chats e arquivos `.md/.txt/.pdf` indicados, priorizando `CHATS REFERENCIA ORBIT CORP MODULAR DEV METHOD -PTBR.md`.
- Se houver repositórios: ler READMEs, docs de arquitetura e roadmaps; ignorar repositórios marcados explicitamente para ignorar.
- Registrar links externos; quando possível, anexar starters na pasta `/_starters/` (documentar o caminho).

## Regras de Linkagem e Glossário
- Transformar termos técnicos em wikilinks para `06-Glossario-Tecnico/...`.
- Padrão de nota de glossário: definição, importância no ecossistema, exemplo prático, prompt para IA, libs/ferramentas, referências.
- Exemplo: `[[Glossario-Tecnico/JWT]]` com referências a `https://jwt.io/` e libs (Node: `jsonwebtoken`, Python: `pyjwt`).

## Módulos OBM
- Criar um arquivo por módulo em `03-Modulos-OBM/` seguindo o template: objetivo, contrato com o core, APIs REST, SDKs, configuração `.env`, fluxos principais, checklists, prompts de ajuda para IA.
- Módulos prioritários: `obm-auth`, `obm-chat`, `obm-orchestrator`, `obm-payments`, `obm-notifications`, `obm-analytics`, `obm-nft-marketplace`.

## Stacks e Infra
- Documentar Stack Oficial e guias por stack:
- `Backend-TS-Nest`: padrões de módulos, guards, interceptors, DTOs, validação, testes.
- `Backend-Python-FastAPI`: routers, pydantic models, deps, segurança, testes.
- `Frontend-React-Next`: pages/app router, SSR/SSG, state, UI libs, testes.
- `Banco-Postgres-Redis`: migrations, índices, caching, pub/sub, persistência.
- `Docker-e-Deploy`: dockerfiles, compose, envs, secrets, CI/CD.

## IA e Agents
- Arquitetura de Agents (Architect, Codex Dev, Executor) com papéis e handoffs.
- Receitas de prompts por objetivo (novo módulo, novo app, refatoração, testes, Docker, documentação).
- Incluir exemplos de “Protocolo de entrega” entre agents (arquivos `ARCHITECTURE.md`, `PLAN.md`).

## Receitas e Playbooks
- “Receitas-Para-Novos-Modulos”: passos, checklists, pitfalls.
- “Receitas-Para-Novos-Apps”: composição de módulos OBM e geração de back/front/docs/tests.
- “Checklist-Seguranca”: secrets, RBAC, validação, rate limits, logs.
- “Checklist-Escalabilidade”: cache, filas, sharding, observabilidade.
- “Guia-Anti-Erros”: lista de erros comuns, causas, prevenção, prompts de correção.

## Log e Histórico
- Linha do tempo de decisões, tentativas de apps, lições e reaproveitamento.
- Registrar marcos e mudanças de stack/módulos.

## RULES GLOBAL
- Naming: usar `obm-*` e placeholders de apps em todo o vault.
- Contratos: todo módulo deve definir entrada/saída, erros padronizados e APIs/SDKs.
- Segurança: nunca hardcode secrets; usar `.env`/secret manager; validar entradas; JWT obrigatório onde houver login.
- Conexão: preferir APIs REST entre linguagens e packages/libs quando na mesma linguagem.
- Linkagem: todo termo técnico vira wikilink para glossário; manter navegação bidirecional.
- Fonte da verdade: não adaptar/excluir documentação sem autorização explícita após leitura da nova; sempre solicitar aprovação para incluir/excluir regras.
- Stack Fixa: adotar oficialmente NestJS, FastAPI, Next.js, Postgres, Redis, Docker; descrever conversões de open-source para essa stack.
- Conversão de módulos: criar guias para portar libs/códigos externos para nossa arquitetura OBM, preservando contratos e segurança.
- Ignore/Index: configurar arquivos ignorados do index e suporte a ingestão de `.docx` conforme diretriz; manter índices limpos.
- Cache Hygiene: sempre limpar/otimizar caches ao atualizar documentação; registrar operação.
- Validação: cada instrução deve ter método de verificação e avisos de armadilhas; nunca sugerir abordagens que levem a falhas.

## Trae Tasks e Prompting
- Explicar `.task`: unidade de trabalho atômica coordenada entre agents; definir objetivo claro, entradas, saídas e restrições.
- Ensinar a criar múltiplas tasks simultâneas: ingestão de chats, geração de glossário, scaffold de módulos, criação de receitas, montagem de timeline.
- Exemplos de prompts:
- “Criar tasks paralelas: 1) Ler `CHATS REFERENCIA...` e extrair termos; 2) Gerar notas de glossário; 3) Escrever templates `03-Modulos-OBM/`; 4) Compilar `Guia-Anti-Erros`; 5) Montar `Linha-do-Tempo`.”
- “Task de auto-limpeza: remover arquivos órfãos, atualizar índices, validar wikilinks quebrados, otimizar imagens.”
- “Task de auto-instalação de plugins: sugerir e registrar plugins (Dataview, Templater, Advanced Tables, Mermaid) e suas configurações.”
- “Task de verificação: auditar se termos estão linkados, contratos definidos, checklists presentes; reportar faltas e propor correções.”

## Critérios de Conclusão
- Todos os conceitos dos chats/arquivos têm nota própria ou estão integrados claramente.
- Termos técnicos linkados ao glossário.
- Módulos mencionados possuem ficha completa em `03-Modulos-OBM`.
- Existem guias: uso do vault, criar novo módulo, criar novo app com IA, Guia Anti-Erros.
- Usuário consegue abrir o Obsidian, ler o índice, entender o ecossistema e seguir passo a passo.

## Fases de Implementação
- Fase 0: Preparar estrutura de pastas e placeholders.
- Fase 1: Ingestão das fontes e extração de entidades (módulos, termos, stacks, decisões).
- Fase 2: Gerar e linkar Glossário Técnico com exemplos e prompts.
- Fase 3: Criar fichas dos Módulos OBM com contratos e fluxos.
- Fase 4: Documentar Stacks e Infra com guias práticos e checklists.
- Fase 5: Montar IA e Agents com receitas e protocolo de entrega.
- Fase 6: Elaborar Receitas e Playbooks, incluindo Guia Anti-Erros.
- Fase 7: Compilar Referências Externas, starters e mídia.
- Fase 8: Registrar Log e Histórico com linha do tempo.
- Fase 9: Aplicar RULES GLOBAL, configurar ignore/index e higiene de cache.
- Fase 10: Validação cruzada e solicitações de aprovação para ajustes finais.

## Aprovações e Iteração
- Antes de alterar regras globais ou remover/alterar notas, solicitar aprovação explícita.
- Após cada fase, emitir relatório de progresso, lacunas e propostas de melhoria.
- Iterar até cumprir todos os critérios de conclusão.