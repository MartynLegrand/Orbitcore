# RECOMENDAÇÕES DE NOVAS REGRAS — REGRAS 13-21

> **Documento:** Proposta de novas regras baseadas na análise do dossier  
> **Data:** 2025-11-16  
> **Objetivo:** Formalizar regras implícitas descobertas nos 39 blocos

---

## ESTRUTURA DAS NOVAS REGRAS

Cada regra proposta contém:
1. **Número e Título**
2. **Fundamentação** (onde aparece no chat/dossier)
3. **Conteúdo da Regra**
4. **Exemplos de Aplicação**
5. **Relacionamento com Regras Existentes**

---

## REGRA 13: Open-Source Ético e Reaproveitamento

### Fundamentação
- **Blocos:** 17-20
- **Evidência:** Busca intensiva por repositórios open-source (Reallusion alternatives, 3D tools)
- **Citação implícita:** "PRECISO DE TUDO QUE A REALLUSION TENHA OPEN SOURCE REPOSITORIO"

### Conteúdo da Regra

**Sempre buscar, avaliar e reusar soluções open-source antes de desenvolver do zero.**

#### Critérios de Seleção:
- **License Compliance:**
  - Permitidas: MIT, Apache 2.0, BSD-3-Clause
  - Avaliar caso a caso: GPL, LGPL
  - Proibidas para integração direta: AGPL (sem autorização)

- **Qualidade Mínima:**
  - Última atualização: < 6 meses (preferencial) ou < 12 meses (aceitável)
  - Stars: > 50 (indicativo de adoção)
  - Contributors: > 5 (não depender de uma pessoa)
  - Issues: ratio issues/stars < 20%
  - Test coverage: > 60% (se disponível)

- **Security:**
  - Zero CVEs críticos não resolvidos
  - Dependencies sem vulnerabilidades conhecidas (usar `npm audit`, `pip check`)
  - Code scanning reports limpos (se disponível)

- **Maintainability:**
  - Documentação existente (README, docs/)
  - Código legível e organizado
  - Histórico de releases regular

#### Processo de Adoção:
1. **Avaliação inicial** usando checklist (ver `08-Referencias-Externas/05-Criterios-Selecao-Repos-OS.md`)
2. **Security audit** básico (dependencies, CVEs)
3. **Proof of Concept** (integrar em ambiente de dev)
4. **Conversão para padrão obm-*** se necessário (Regra 7)
5. **Documentação** em catálogo (`08-Referencias-Externas/04-Catalogo-OS-3D-LLM-Reuso.md`)

#### Ética e Créditos:
- Sempre manter atribuição aos autores originais
- Respeitar termos de license rigorosamente
- Contribuir de volta (bug fixes, improvements) quando viável
- Não fazer fork desnecessário; preferir use direto ou PR upstream

### Exemplos de Aplicação
- ✅ Usar biblioteca 3D open-source com MIT license, bem mantida
- ✅ Adaptar módulo FastAPI open-source para nosso padrão obm-*
- ❌ Copiar código de repo GPL sem entender implicações de license
- ❌ Usar repo abandonado há 3 anos sem avaliação de security

### Relacionamento com Outras Regras
- **Complementa Regra 7:** Conversão de Open-Source para Nossa Stack
- **Suporta Regra 6:** Stack Fixa (encontrar componentes compatíveis)
- **Reforça Regra 3:** Segurança (audit de código externo)

---

## REGRA 14: Clareza Sobre Concisão na Documentação

### Fundamentação
- **Blocos:** 26
- **Evidência:** "SEMPRE COLOQUE O QUE E ANTES TIPO FRONT END PYTON MESMO QUE REPITA EM TUDO PRA EU LER"
- **Filosofia:** Redundância explícita é preferível a ambiguidade

### Conteúdo da Regra

**Documentação deve priorizar clareza e facilidade de leitura sobre concisão.**

#### Princípios:
1. **Contexto Explícito:**
   - Sempre incluir categoria/tipo antes do item
   - Exemplo: "FRONTEND: React + Next.js" (não só "Next.js")
   - Exemplo: "BACKEND: Python + FastAPI" (não só "FastAPI")

2. **Redundância Permitida:**
   - Repetir contexto em cada seção se facilitar leitura
   - Não assumir que leitor leu tudo antes
   - Cada seção deve ser auto-contida quando possível

3. **Wikilinks Descritivos:**
   - ❌ `[[JWT]]`
   - ✅ `[[Glossario-Tecnico/JWT|autenticação via JWT]]`
   - Texto do link deve dar contexto

4. **Estrutura Previsível:**
   - Usar headers consistentes
   - Ordem padronizada (Contexto → Detalhes → Exemplos)
   - Formatação uniforme

5. **Evitar Abreviações Não Óbvias:**
   - ✅ "TypeScript" (primeira menção)
   - ✅ "TS" (menções subsequentes, se contexto claro)
   - ❌ "TS" logo de início sem definir
   - Glossário para termos técnicos

#### Checklist de Clareza:
- [ ] Leitor novo consegue entender sem contexto prévio?
- [ ] Categoria/tipo está explícito?
- [ ] Termos técnicos têm wikilink para glossário?
- [ ] Exemplos concretos estão presentes?
- [ ] Ambiguidade foi eliminada?

### Exemplos de Aplicação

**❌ Menos Claro:**
```markdown
## Stack
- Next.js
- FastAPI
- Postgres
```

**✅ Mais Claro:**
```markdown
## Stack Oficial por Camada

### Frontend
- **Framework:** Next.js (React framework)
- **Linguagem:** TypeScript

### Backend
- **Framework Python:** FastAPI (REST APIs)
- **Framework TypeScript:** NestJS (microservices, GraphQL)

### Database
- **Relational:** PostgreSQL (dados estruturados)
- **Cache:** Redis (cache, filas)
```

### Relacionamento com Outras Regras
- **Complementa Regra 4:** Linkagem e Navegação (wikilinks descritivos)
- **Suporta Regra 5:** Fonte da Verdade (clareza evita interpretações múltiplas)

---

## REGRA 15: Multi-Model Orchestration

### Fundamentação
- **Blocos:** 11-16
- **Evidência:** "GPT-5 Pro é melhor para dizer o que outros devem fazer" + "GPT-5.1 consegue programar coisa pesada"
- **Insight:** Arquitetura multi-model não é opcional, é mandatória

### Conteúdo da Regra

**Usar modelo de AI apropriado para cada tipo de tarefa. Proibido usar um único modelo para tudo.**

#### Mapeamento Modelo → Tarefa:

| Agent/Papel | Modelo | Tarefa | Razão |
|-------------|--------|--------|-------|
| Architect | GPT-5 Pro | Planejamento, decisões estratégicas, arquitetura, orquestração | Raciocínio complexo, visão holística |
| Dev | GPT-5.1 Codex | Implementação, coding pesado, refactoring, debugging | Especializado em código |
| Executor | GPT-5 (padrão) | Validação, testes, execução de comandos, scripts simples | Tarefas mais leves, custo menor |
| Research | GPT-4o | Pesquisa, sumarização, análise de docs | Boa relação custo/benefício |

#### Critérios de Escolha:
- **Complexidade da tarefa:**
  - Alta complexidade → Pro
  - Coding intensivo → 5.1
  - Validação/execução → Standard

- **Custo:**
  - Pro: $15 input / $120 output (1M tokens)
  - Standard: $1.25 input / $10 output (1M tokens)
  - Usar modelo mais barato quando adequado

- **Especialização:**
  - Architect tasks → Pro (não usar 5.1 para planejamento)
  - Coding tasks → 5.1 (não usar Pro para implementar)

#### Protocol de Handoff:
1. **Architect → Dev:**
   - Input: Task specification, requirements, constraints
   - Output: Código implementado, testes
   - Formato: JSON com task_id, description, context

2. **Dev → Executor:**
   - Input: Código, comandos a executar
   - Output: Logs de execução, resultados de testes
   - Formato: Shell commands + expected outputs

3. **Executor → Architect:**
   - Input: Resultados, erros (se houver)
   - Output: Decisão de próximo passo ou conclusão
   - Formato: Status report + metrics

### Exemplos de Aplicação
- ✅ Architect (Pro) planeja, Dev (5.1) implementa, Executor (Standard) valida
- ✅ Usar 5.1 para refactoring de módulo complexo
- ❌ Usar Pro para escrever código simples (desperdício de custo)
- ❌ Usar Standard para decisões arquiteturais complexas (falta de capability)

### Relacionamento com Outras Regras
- **Implementa Regra 6:** Stack Fixa (modelos são parte da stack de AI)
- **Suporta Regra 12:** Tasks Trae (cada task tem agent apropriado)
- **Conecta com Regra 16:** Cost-Awareness (escolha consciente de modelo)

---

## REGRA 16: Cost-Awareness e Otimização

### Fundamentação
- **Blocos:** 01-03
- **Evidência:** Múltiplas perguntas sobre "modo mais barato", pricing, cost optimization
- **Realidade:** GPT-5 Pro é 12x mais caro que Standard em output tokens

### Conteúdo da Regra

**Toda decisão de uso de AI deve considerar custo explicitamente. Implementar monitoramento e controles.**

#### Princípios de Cost-Awareness:

1. **Escolha Justificada:**
   - Documentar por que modelo X foi escolhido para tarefa Y
   - Trade-off performance vs custo deve ser consciente

2. **Budgets e Limites:**
   - Ambiente DEV: Budget menor ($50-100/mês)
   - Ambiente PROD: Budget controlado ($500-1000/mês)
   - Alertas em 50%, 75%, 90% do budget

3. **Otimizações Técnicas:**
   - **Prompt Engineering:** Reduzir tokens desnecessários
   - **Caching:** Reusar respostas para prompts similares
   - **Batch Processing:** Agrupar requests quando possível
   - **Streaming:** Para UX melhor sem aumentar custo
   - **Compression:** Resumir contexto longo antes de enviar

4. **Monitoramento:**
   - Dashboard de custos em tempo real
   - Attribution por:
     - Agent (Architect/Dev/Executor)
     - Projeto/módulo
     - Feature/task
     - Ambiente (dev/staging/prod)
   - Forecast mensal baseado em uso recente

5. **Automated Controls:**
   - Rate limiting por agent/projeto
   - Shutdown automático se budget exceder (com override manual)
   - Degradação para modelo mais barato em caso de spike

#### Cost Optimization Checklist:
- [ ] Modelo escolhido é o mais barato adequado para a tarefa?
- [ ] Prompt está otimizado (sem tokens desnecessários)?
- [ ] Caching está habilitado onde aplicável?
- [ ] Monitoramento de custo está ativo?
- [ ] Alertas estão configurados?
- [ ] Team está ciente dos custos?

### Exemplos de Aplicação

**✅ Boas Práticas:**
- Usar Pro apenas para Architect tasks (20% do uso)
- Implementar cache de prompts frequentes
- Monitorar custo por feature durante desenvolvimento
- Alertar quando projeto exceder $100 na semana

**❌ Anti-Patterns:**
- Usar Pro para tudo "porque é melhor"
- Não monitorar custos até receber fatura
- Enviar contexto completo sempre (100K tokens) quando resumo bastaria
- Desenvolver sem budget definido

### Relacionamento com Outras Regras
- **Suporta Regra 15:** Multi-Model (escolher modelo certo economiza)
- **Complementa Regra 10:** Validação (validar se custo está controlado)

---

## REGRA 17: Validação Obsessiva e Completude

### Fundamentação
- **Blocos:** 36, 38, 39
- **Evidência:** "VOCE SE LEMBRA DE TUDO?", "REVIZE... NÃO DEIXOU PASSAR NADA?", "FACA TUDO + CORRECOES"
- **Filosofia:** Zero tolerance para omissões

### Conteúdo da Regra

**Toda entrega deve passar por validação completa antes de ser considerada finalizada. Qualidade > Velocidade.**

#### Processo de Validação:

1. **Self-Review:**
   - Revisar próprio trabalho antes de entregar
   - Checklist específico para tipo de entrega (código, docs, config)
   - Simular uso por pessoa que não tem contexto

2. **Completude Check:**
   - Todos os itens do escopo foram cobertos?
   - Algum caso de uso foi esquecido?
   - Documentação reflete 100% do implementado?

3. **Cross-References:**
   - Wikilinks funcionam?
   - Referências a outros documentos estão corretas?
   - Glossário está atualizado?

4. **Auditoria Final:**
   - Usar checklist formal (ver `07-Receitas-e-Playbooks/02-Checklist-de-Auditoria.md`)
   - Validar contra requirements originais
   - Confirmar que nada foi perdido no caminho

#### Checklists Obrigatórios:

**Para Código:**
- [ ] Código compila/roda sem erros
- [ ] Testes escritos e passando
- [ ] Linting sem warnings
- [ ] Security scan limpo
- [ ] Docs atualizadas (README, comments)
- [ ] Nenhum hardcoded secret
- [ ] Edge cases cobertos

**Para Documentação:**
- [ ] Estrutura completa (nenhuma seção "TODO")
- [ ] Wikilinks testados (não quebrados)
- [ ] Exemplos concretos presentes
- [ ] Glossário atualizado
- [ ] Cross-references corretas
- [ ] Spelling/grammar verificados
- [ ] Formatação consistente

**Para Configuração:**
- [ ] Configs testadas em ambiente limpo
- [ ] Defaults fazem sentido
- [ ] Docs explicam cada opção
- [ ] Secrets em .env (não hardcoded)
- [ ] Validação de inputs
- [ ] Error messages úteis

#### "Não Deixou Passar Nada?"
- Esta pergunta deve ser padrão antes de finalizar qualquer entrega
- Responder com checklist completo do que foi verificado
- Se algo foi intencionalmente omitido, justificar

### Exemplos de Aplicação
- ✅ Usar checklist de auditoria antes de cada delivery
- ✅ Revisar documentação mesmo que pareça "óbvia"
- ✅ Validar que código implementa 100% dos requirements
- ❌ Entregar "quase pronto" sem validação completa
- ❌ Assumir que algo está correto sem verificar

### Relacionamento com Outras Regras
- **Expande Regra 10:** Validação e Confiabilidade
- **Suporta Regra 5:** Fonte da Verdade (validar que docs refletem realidade)

---

## REGRA 18: Modularização e Taxonomia

### Fundamentação
- **Blocos:** 22-23
- **Evidência:** "LANGUAGE, STACK, MODULE, DIFF, CONTRACT, REMIX, JWT"
- **Sistema:** Hierarquia clara de componentes

### Conteúdo da Regra

**Sistema deve ser organizado em hierarquia clara: LANGUAGE → STACK → MODULE → COMPONENT.**

#### Taxonomia Formal:

```
LANGUAGE (Linguagem de Programação)
├── TypeScript
│   └── STACK (Framework/Conjunto de Ferramentas)
│       ├── NestJS
│       │   └── MODULE (Módulo Funcional)
│       │       ├── obm-auth
│       │       │   └── COMPONENT (Sub-componente)
│       │       │       ├── JWT Handler
│       │       │       ├── OAuth Provider
│       │       │       └── RBAC Middleware
│       │       └── obm-notifications
│       └── Next.js
│           └── MODULE
│               └── obm-ui-kit
└── Python
    └── STACK
        └── FastAPI
            └── MODULE
                └── obm-api-gateway
```

#### Definições:

**LANGUAGE:**
- Linguagem de programação base
- Ex: TypeScript, Python, Rust, Go

**STACK:**
- Framework principal + conjunto de ferramentas
- Ex: NestJS (TS), FastAPI (Python), Next.js (TS/React)
- Inclui: framework, ORM, libs essenciais

**MODULE:**
- Unidade funcional reutilizável
- Prefixo obm-* obrigatório (Regra 1)
- Ex: obm-auth, obm-notifications, obm-3d-renderer
- Tem contract claro (Regra 2)

**COMPONENT:**
- Sub-unidade dentro de módulo
- Ex: JWTHandler, OAuthProvider, RBACMiddleware
- Pode ser class, function, service

#### Elementos Adicionais:

**CONTRACT:**
- Interface/API pública do módulo
- Define: inputs, outputs, errors, tipos
- Versionado (v1, v2)

**DIFF:**
- Diferença entre versões
- Change log, migration guide
- Breaking changes destacados

**REMIX:**
- Composição de múltiplos módulos
- Ex: obm-auth-social = obm-auth + obm-oauth-providers
- Documentar dependências

#### Regras de Nomenclatura:
- Módulos: `obm-{funcao}` (lowercase, hyphens)
- Componentes: `PascalCase` (classes) ou `camelCase` (functions)
- Stacks: Nome oficial (NestJS, FastAPI)
- Languages: Nome completo na primeira menção

### Exemplos de Aplicação

**✅ Correto:**
```
BACKEND: TypeScript + NestJS
├── MODULE: obm-auth
│   ├── COMPONENT: JWTService
│   ├── COMPONENT: AuthGuard
│   └── CONTRACT: IAuthService (v1.2)
└── MODULE: obm-users
    └── COMPONENT: UserRepository
```

**❌ Incorreto:**
```
martyn-auth  (não usar prefixo "martyn")
Auth  (falta contexto de stack)
user-management  (falta prefixo obm-)
```

### Relacionamento com Outras Regras
- **Implementa Regra 1:** Nomenclatura e Placeholders
- **Suporta Regra 2:** Contratos e Integração
- **Conecta Regra 6:** Stack Fixa

---

## REGRA 19: Papéis Fixos de Agents

### Fundamentação
- **Blocos:** 13-16
- **Evidência:** Separação clara Architect/Dev/Executor com modelos e responsabilidades específicas
- **Princípio:** Don't mix responsibilities

### Conteúdo da Regra

**Agents têm papéis fixos e responsabilidades bem definidas. Não misturar concerns.**

#### Definição de Papéis:

**ARCHITECT (GPT-5 Pro):**
- **Responsabilidades:**
  - Planejamento de features e arquitetura
  - Decisões estratégicas (tecnologia, padrões)
  - Orquestração de outros agents
  - Review de alto nível
  - Documentação de decisões arquiteturais

- **NÃO faz:**
  - Implementação de código
  - Execução de comandos
  - Debugging detalhado
  - Testes unitários

- **Output:**
  - Task specifications para Dev
  - Architectural Decision Records (ADRs)
  - Technical designs

**DEV (GPT-5.1 Codex):**
- **Responsabilidades:**
  - Implementação de código
  - Refactoring
  - Debugging
  - Escrita de testes
  - Code review de implementação

- **NÃO faz:**
  - Decisões arquiteturais sem consultar Architect
  - Executar código (deixar para Executor)
  - Planejamento de features

- **Output:**
  - Código implementado
  - Testes
  - Documentação técnica (docstrings, comments)

**EXECUTOR (GPT-5 Standard):**
- **Responsabilidades:**
  - Executar comandos
  - Rodar testes
  - Validar outputs
  - Coletar logs e métricas
  - Reporting de status

- **NÃO faz:**
  - Escrever código novo
  - Fazer decisões (reportar para Architect)
  - Modificar arquitetura

- **Output:**
  - Logs de execução
  - Test results
  - Status reports
  - Metrics

#### Protocol de Colaboração:

```
┌──────────────┐
│  ARCHITECT   │ (GPT-5 Pro)
│  (Planeja)   │
└──────┬───────┘
       │ Task Spec
       ▼
┌──────────────┐
│     DEV      │ (GPT-5.1)
│ (Implementa) │
└──────┬───────┘
       │ Code + Tests
       ▼
┌──────────────┐
│  EXECUTOR    │ (GPT-5 Standard)
│  (Valida)    │
└──────┬───────┘
       │ Results
       ▼
┌──────────────┐
│  ARCHITECT   │ (Decide próximo passo)
└──────────────┘
```

#### Quando Escalar:
- **Dev → Architect:** Decisão técnica complexa, trade-off significativo
- **Executor → Architect:** Falha inesperada, ambiguidade em task
- **Architect → Architect:** Nunca (um Architect por projeto)

### Exemplos de Aplicação
- ✅ Architect define "criar módulo de auth", Dev implementa, Executor valida
- ✅ Dev encontra ambiguidade, escala para Architect
- ❌ Dev decide mudar de SQL para NoSQL sem consultar Architect
- ❌ Architect escreve implementação completa (deve delegar para Dev)
- ❌ Executor modifica código porque teste falhou (deve reportar para Dev)

### Relacionamento com Outras Regras
- **Implementa Regra 15:** Multi-Model Orchestration
- **Suporta Regra 12:** Tasks Trae (cada task tem agent apropriado)

---

## REGRA 20: Trae AI como Plataforma Oficial

### Fundamentação
- **Blocos:** 15-16, 34
- **Evidência:** "O IDE que uso é o Trae AI", configuração de agents no Trae
- **Realidade:** Trae não é só tool, é plataforma de trabalho

### Conteúdo da Regra

**Trae AI é a plataforma oficial de desenvolvimento e orchestration. Setup e workflows devem ser compatíveis.**

#### Componentes do Trae:

1. **IDE Features:**
   - Editor de código
   - Git integration
   - Terminal integrado
   - Extensions

2. **AI Orchestration:**
   - Agent management
   - Task definitions (.task files)
   - Workflow automation
   - Context management

3. **Collaboration:**
   - Shared workspace
   - Team agents
   - Review workflows

#### Padrões Trae:

**Estrutura de Projeto:**
```
project-root/
├── .trae/
│   ├── config.json          # Configurações do Trae
│   ├── agents.yml           # Definição de agents
│   └── tasks/               # Task definitions
│       ├── setup.task
│       ├── build.task
│       └── deploy.task
├── src/
├── tests/
└── README.md
```

**Task Definition (.task):**
```yaml
name: Build and Test
agent: dev
description: Compilar código e rodar testes
steps:
  - run: npm install
  - run: npm run build
  - run: npm test
outputs:
  - build/
  - coverage/
```

**Agent Configuration:**
```yaml
agents:
  architect:
    model: gpt-5-pro-2025-10-06
    role: architect
    permissions:
      - read: all
      - write: docs, plans
      - execute: none
  
  dev:
    model: gpt-5.1-codex
    role: developer
    permissions:
      - read: all
      - write: src, tests
      - execute: dev-commands
  
  executor:
    model: gpt-5
    role: executor
    permissions:
      - read: all
      - write: logs
      - execute: all
```

#### Setup Requirements:

1. **Mandatory Configs:**
   - `.trae/config.json` em todo projeto
   - Agents definidos em `.trae/agents.yml`
   - Tasks comuns em `.trae/tasks/`

2. **Recommended Extensions:**
   - Trae AI Agents
   - GitLens
   - Markdown Preview
   - REST Client

3. **Workspace Settings:**
   - Auto-save habilitado
   - Format on save (Prettier/Black)
   - Linting integrado

#### Onboarding:
- Novo desenvolvedor deve seguir `07-Receitas-e-Playbooks/01-Setup-Ambiente-Trae.md`
- Template de projeto disponível em `_templates/trae-project-template/`
- Script de scaffold: `scripts/create-trae-project.sh`

### Exemplos de Aplicação
- ✅ Todo projeto tem `.trae/` com configurações
- ✅ Tasks comuns (build, test, deploy) definidas como .task files
- ✅ Agents configurados consistentemente entre projetos
- ❌ Usar outra IDE sem integração Trae
- ❌ Rodar agents manualmente fora do Trae (perde orchestration)

### Relacionamento com Outras Regras
- **Implementa Regra 12:** Tasks Trae (.task files)
- **Suporta Regra 19:** Papéis de Agents (configuração no Trae)
- **Conecta Regra 5:** Fonte da Verdade (Trae configs são source of truth)

---

## REGRA 21: Governança de Mudanças em Documentação

### Fundamentação
- **Blocos:** 36-39, especialmente Regra 5 existente
- **Evidência:** "REVIZE... NÃO DEIXOU PASSAR NADA?", preocupação com aprovação
- **Gap:** Regra 5 menciona aprovação mas não define processo

### Conteúdo da Regra

**Mudanças em documentação crítica (especialmente RULES) requerem processo formal de aprovação.**

#### Documentação Crítica:
- `00-Config/03-RULES-GLOBAL.md` (estas regras)
- `00-Config/01-Mapa-Geral-do-Ecossistema.md`
- `00-Config/05-Protocolo-Orbit-OBM.md`
- `04-Stacks-e-Infra/01-Stack-Oficial-*.md`
- Qualquer ADR (Architectural Decision Record)

#### Processo de Mudança:

**Tier 1: Mudanças Críticas (RULES, ADRs)**
1. **Proposta:**
   - Criar documento de proposta: `proposals/YYYY-MM-DD-{titulo}.md`
   - Incluir: Motivação, Conteúdo, Impacto, Alternativas Consideradas

2. **Review:**
   - Architect deve revisar
   - Discussão em comentários da proposta
   - Possível reunião se mudança significativa

3. **Aprovação:**
   - Aprovação explícita de Architect (comentário "APPROVED" ou similar)
   - Documentar decisão e data

4. **Implementação:**
   - Fazer mudança na documentação
   - Atualizar changelog: `99-Log-e-Historico/CHANGELOG-RULES.md`
   - Commit com mensagem: `[RULE] Add/Update Rule N: {titulo}`

5. **Comunicação:**
   - Notificar team sobre mudança (Slack, email)
   - Atualizar documentação dependente

**Tier 2: Mudanças Médias (Docs Técnicas)**
1. Criar PR com mudanças
2. Self-review (checklist)
3. Opcional: Peer review
4. Merge após verificação

**Tier 3: Mudanças Leves (Typos, Formatting)**
1. Fix diretamente
2. Commit: `[DOCS] Fix typo in {file}`

#### Versionamento:
- RULES: Major.Minor (atual: 1.0 com 12 regras → 2.0 com 21 regras)
- Docs técnicas: Usar date-based (YYYY-MM-DD no frontmatter)
- ADRs: Numeração sequencial (ADR-001, ADR-002)

#### Rollback:
- Git revert se mudança causar problemas
- Documentar razão do rollback
- Reabrir discussão de proposta

#### Changelog:
```markdown
# Changelog - RULES GLOBAL

## [2.0.0] - 2025-11-16
### Added
- Rule 13: Open-Source Ético e Reaproveitamento
- Rule 14: Clareza Sobre Concisão
- Rule 15: Multi-Model Orchestration
- Rule 16: Cost-Awareness
- Rule 17: Validação Obsessiva
- Rule 18: Modularização e Taxonomia
- Rule 19: Papéis Fixos de Agents
- Rule 20: Trae AI como Plataforma
- Rule 21: Governança de Mudanças

## [1.0.0] - 2025-XX-XX
### Initial Release
- Rules 1-12
```

### Exemplos de Aplicação
- ✅ Criar proposal para nova regra, obter aprovação, implementar, atualizar changelog
- ✅ Fix typo em README diretamente
- ❌ Mudar RULES sem proposta formal
- ❌ Atualizar Stack Oficial sem discussão
- ❌ Fazer mudança crítica e não comunicar team

### Relacionamento com Outras Regras
- **Expande Regra 5:** Fonte da Verdade e Aprovação
- **Suporta Regra 17:** Validação Obsessiva (validar mudanças)
- **Conecta Regra 4:** Linkagem (atualizar cross-references após mudança)

---

## RESUMO DAS NOVAS REGRAS

| # | Título | Categoria | Prioridade | Fundamentação |
|---|--------|-----------|------------|---------------|
| 13 | Open-Source Ético | Processo | Alta | Blocos 17-20 |
| 14 | Clareza Sobre Concisão | Documentação | Média | Bloco 26 |
| 15 | Multi-Model Orchestration | AI/Agents | Crítica | Blocos 11-16 |
| 16 | Cost-Awareness | AI/Agents | Alta | Blocos 01-03 |
| 17 | Validação Obsessiva | Qualidade | Crítica | Blocos 36-39 |
| 18 | Modularização e Taxonomia | Arquitetura | Alta | Blocos 22-23 |
| 19 | Papéis Fixos de Agents | AI/Agents | Crítica | Blocos 13-16 |
| 20 | Trae AI Plataforma | Tooling | Média | Blocos 15-16, 34 |
| 21 | Governança de Mudanças | Processo | Alta | Blocos 36-39 |

---

## PRÓXIMOS PASSOS

### Implementação das Novas Regras:

1. **Aprovação Formal:**
   - [ ] Architect revisar cada regra proposta
   - [ ] Discussão de pontos ambíguos
   - [ ] Aprovação explícita: "APPROVED - Rules 13-21"

2. **Atualização de RULES-GLOBAL.md:**
   - [ ] Adicionar Regras 13-21 ao arquivo oficial
   - [ ] Atualizar table of contents
   - [ ] Versionar como 2.0.0

3. **Changelog:**
   - [ ] Criar `99-Log-e-Historico/CHANGELOG-RULES.md`
   - [ ] Documentar mudança de 1.0 (12 regras) para 2.0 (21 regras)

4. **Comunicação:**
   - [ ] Notificar team sobre novas regras
   - [ ] Highlighting de regras críticas (15, 17, 19)

5. **Documentação Suporte:**
   - [ ] Criar documentos referenciados nas regras
   - [ ] Atualizar docs existentes com novas regras

6. **Auditoria de Conformidade:**
   - [ ] Verificar se código/docs existentes seguem novas regras
   - [ ] Plano de correção para não-conformidades

---

## MÉTRICAS DE SUCESSO

- [ ] Todas as 9 novas regras aprovadas formalmente
- [ ] RULES-GLOBAL.md atualizado para versão 2.0
- [ ] 100% das regras têm exemplos concretos
- [ ] Team treinado nas novas regras
- [ ] Auditoria de conformidade completa
- [ ] Documentação suporte criada (6+ documentos novos)

---

**FIM DAS RECOMENDAÇÕES DE NOVAS REGRAS**
