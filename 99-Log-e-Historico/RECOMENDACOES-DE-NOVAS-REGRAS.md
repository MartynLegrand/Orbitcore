# RECOMENDAÇÕES DE NOVAS REGRAS (13-21)

> **Documento:** Proposta de expansão das RULES GLOBAL de 12 para 21 regras  
> **Data:** 2025-11-16  
> **Origem:** Análise profunda do dossier de 39 blocos  
> **Status:** Aguardando aprovação para implementação

---

## SUMÁRIO EXECUTIVO

Após análise minuciosa dos 39 blocos do dossier, identificou-se a necessidade de **9 novas regras** para complementar as 12 existentes. Estas regras emergem de:

- **Conteúdo implícito** não capturado nas regras atuais
- **Decisões arquiteturais** tomadas no chat mas não formalizadas
- **Gaps de governança** que precisam ser preenchidos
- **Padrões estabelecidos** de fato mas não documentados

As regras propostas cobrem:
- Gestão de IA e Agents (4 regras)
- Modularização e Contratos (2 regras)
- Documentação e Governança (3 regras)

---

## ESTRUTURA DE CADA REGRA

Cada proposta contém:
- **Número e Título**
- **Fundamentação** (blocos que originaram)
- **Texto da Regra** (pronto para inserção)
- **Exemplos Práticos**
- **Como Validar Conformidade**
- **Penalidades por Violação**

---

## REGRA 13: Open-Source Ético

### 📍 Fundamentação
**Blocos:** 17-20, 27  
**Conteúdo Explícito:** Busca por alternativas open-source, necessidade de reaproveitamento  
**Conteúdo Implícito:** Filosofia de reuso ético, respeito a licenças, contribuição upstream  
**Gap Identificado:** GAP-ARCH-03, GAP-ARCH-04, GAP-ARCH-05

### 📜 Texto da Regra

```markdown
## 13. Open-Source Ético e Reaproveitamento

- Todo código open-source reutilizado deve ter licença compatível (MIT, Apache 2.0, BSD).
- Licenças copyleft (GPL, AGPL) só podem ser usadas em módulos isolados.
- Sempre documentar: origem do código, versão, licença, data de fork.
- Preferir **contribuição upstream** a fork sempre que possível.
- Antes de forkar: avaliar se mudanças podem ser PRs no projeto original.
- Manter arquivo `THIRD_PARTY_LICENSES.md` em cada módulo que usa código externo.
- Realizar **due diligence de licenças** antes de qualquer incorporação.
- Nunca remover atribuições ou avisos de copyright originais.
```

### 🎯 Exemplos Práticos

**✅ Correto:**
```markdown
# THIRD_PARTY_LICENSES.md

## Blender Python API
- **Source:** github.com/blender/blender
- **Version:** 3.6.0
- **License:** GPL v3 (usado em módulo isolado)
- **Date:** 2024-01-15
- **Changes:** Fork para adicionar helper functions
- **Upstream PR:** #12345 (contribuído de volta)
```

**❌ Errado:**
```javascript
// Código copiado de lib MIT sem atribuição
function coolFunction() { ... }
```

### ✔️ Como Validar

- [ ] Existe `THIRD_PARTY_LICENSES.md` em cada módulo?
- [ ] Todas as dependências têm licenças compatíveis?
- [ ] Código com GPL está isolado?
- [ ] Atribuições originais preservadas?
- [ ] Considerou contribuir upstream?

### ⚠️ Penalidade por Violação

- Risco legal alto
- Possível remoção de código infrator
- Retrabalho para substituir lib problemática

---

## REGRA 14: Segurança de IA e API Keys

### 📍 Fundamentação
**Blocos:** 01-03, 06-11  
**Conteúdo Explícito:** Configuração de API keys, permissões ALL→WRITE  
**Conteúdo Implícito:** Necessidade de segurança extrema com keys de IA  
**Gap Identificado:** GAP-SEC-03, GAP-SEC-04, GAP-SEC-05, GAP-SEC-06

### 📜 Texto da Regra

```markdown
## 14. Segurança de IA e Gerenciamento de API Keys

- **Nunca hardcode** API keys de IA (OpenAI, Anthropic, etc).
- Usar **secret manager** (AWS Secrets Manager, HashiCorp Vault, ou `.env` localmente).
- **Rotação obrigatória** de keys a cada 90 dias ou em caso de suspeita de vazamento.
- **Ambientes separados:** dev/staging/prod devem ter keys distintas.
- **Permissões mínimas:** conceder apenas permissões necessárias (evitar ALL→WRITE quando possível).
- **Rate limiting:** implementar limites locais além dos da API.
- **Alertas de custo:** definir thresholds de gasto e alertas automáticos.
- **Logs de uso:** registrar todas as chamadas de API (sem logar secrets).
- **Revogar imediatamente** keys comprometidas.
```

### 🎯 Exemplos Práticos

**✅ Correto:**
```typescript
// .env (gitignored)
OPENAI_API_KEY=sk-proj-...
OPENAI_ORG_ID=org-...

// config.ts
export const openAIConfig = {
  apiKey: process.env.OPENAI_API_KEY,
  organization: process.env.OPENAI_ORG_ID,
  maxRetries: 3,
  timeout: 30000,
  maxTokens: 4000, // limite local
}

// logging.ts
logger.info('OpenAI API call', {
  model: 'gpt-5-pro',
  tokens: 1500,
  cost: 0.0225,
  // NUNCA logar: apiKey
})
```

**❌ Errado:**
```javascript
const client = new OpenAI({
  apiKey: 'sk-proj-1234567890abcdef', // HARDCODED!
})
```

### ✔️ Como Validar

- [ ] Nenhuma key hardcoded no código (scan com `git grep "sk-"`)?
- [ ] Arquivo `.env` no `.gitignore`?
- [ ] Sistema de alertas de custo configurado?
- [ ] Rotação de keys agendada (90 dias)?
- [ ] Logs de uso implementados?

### ⚠️ Penalidade por Violação

- **Crítica:** Vazamento de key = custo ilimitado, comprometimento de segurança
- Bloqueio de merge até correção

---

## REGRA 15: Auditoria e Rastreabilidade de Agents

### 📍 Fundamentação
**Blocos:** 11, 36  
**Conteúdo Explícito:** Agentes com acesso total e autonomia  
**Conteúdo Implícito:** Necessidade de rastrear tudo que agentes fazem  
**Gap Identificado:** GAP-SEC-09, GAP-GOV-06

### 📜 Texto da Regra

```markdown
## 15. Auditoria e Rastreabilidade de Agents

- Todo agente IA deve logar **todas as ações** realizadas.
- Logs devem incluir: timestamp, agent ID, ação, input, output, custo, resultado.
- Implementar **audit trail** persistente (não apenas console).
- Em ações destrutivas (delete, overwrite), exigir **confirmação explícita**.
- Manter **histórico de decisões** do agente (por que escolheu X em vez de Y).
- Permitir **replay de sessões** para debugging.
- Logs de agent devem ser **read-only** após escrita (imutáveis).
- Implementar **alertas** para ações anômalas (custos altos, erros repetidos).
```

### 🎯 Exemplos Práticos

**✅ Correto:**
```typescript
// agent-logger.ts
interface AgentAction {
  timestamp: Date
  agentId: 'architect' | 'dev' | 'executor'
  action: string
  input: any
  output: any
  cost: number
  duration: number
  success: boolean
  reasoning?: string
}

agentLogger.log({
  timestamp: new Date(),
  agentId: 'architect',
  action: 'generate_architecture',
  input: { project: 'marketplace-3d' },
  output: { files: ['ARCHITECTURE.md', 'PLAN.md'] },
  cost: 0.05,
  duration: 12000,
  success: true,
  reasoning: 'User requested marketplace with auth, catalog, checkout'
})
```

**❌ Errado:**
```javascript
// Nenhum logging
agent.execute(task)
// Não sabemos o que aconteceu
```

### ✔️ Como Validar

- [ ] Existe `agent-logger` implementado?
- [ ] Todos os agentes logam ações?
- [ ] Logs são persistidos (DB ou arquivo)?
- [ ] Logs são imutáveis?
- [ ] Alertas configurados?

### ⚠️ Penalidade por Violação

- Impossível debugar problemas
- Impossível auditar custos
- Impossível rastrear decisões erradas

---

## REGRA 16: Arquitetura de Multi-Agents

### 📍 Fundamentação
**Blocos:** 12-13, 15-16, 27  
**Conteúdo Explícito:** 3 agentes com papéis distintos (Architect, Dev, Executor)  
**Conteúdo Implícito:** Separação de preocupações, especialização, handoffs  
**Gap Identificado:** GAP-PROC-05, GAP-PROC-09, GAP-GOV-07

### 📜 Texto da Regra

```markdown
## 16. Arquitetura de Multi-Agents

- Sistema de desenvolvimento deve ter **3 agentes** com papéis distintos:
  - **🟦 Architect (GPT-5 Pro):** Planeja, arquiteta, define contratos, valida qualidade.
  - **🟧 Dev (GPT-5.1 Codex):** Implementa código, gera arquivos, cria módulos completos.
  - **🟩 Executor (GPT-5.1):** Ajusta, otimiza, refina, complementa.
- Fluxo obrigatório: **Plan → Execute → Refine**.
- Cada agente **só faz o que é sua responsabilidade** (sem overlap).
- Architect **nunca** implementa código completo, apenas specs.
- Dev **nunca** toma decisões arquiteturais sozinho.
- Executor **nunca** redesenha arquitetura, apenas ajusta implementação.
- Handoffs entre agentes devem seguir **Protocolo de Handoff** (Regra 17).
```

### 🎯 Exemplos Práticos

**✅ Correto - Architect:**
```markdown
# PLAN.md (output do Architect)

## Arquitetura: Marketplace 3D

### Módulos Necessários
1. **auth-module** (já existe, reusado)
2. **catalog-3d-module** (novo)
3. **checkout-module** (novo)
4. **chat-support-module** (reusa base, customiza)

### Contratos
#### catalog-3d-module
**Input:** GET /api/catalog?category=models&filter=trending
**Output:** { items: Model[], total: number, page: number }

### Tarefas para Dev Agent
- [ ] Implementar catalog-3d-module seguindo contrato acima
- [ ] Criar migrações para tabela `models`
- [ ] Implementar endpoints REST
- [ ] Adicionar testes unitários
```

**✅ Correto - Dev:**
```typescript
// catalog-3d-module/src/catalog.service.ts (output do Dev)
@Injectable()
export class CatalogService {
  async getModels(params: CatalogQuery): Promise<CatalogResponse> {
    // Implementação completa seguindo PLAN.md
  }
}
```

**✅ Correto - Executor:**
```typescript
// Ajuste fino (output do Executor)
// Otimização de query, adição de índice, refatoração menor
await this.db.models.findMany({
  where: params.filter,
  orderBy: { trending: 'desc' },
  take: params.limit,
  skip: params.offset,
  // Adicionado índice para performance
})
```

**❌ Errado - Architect implementando:**
```typescript
// ERRADO: Architect não deve gerar código completo
export class CatalogService {
  async getModels() { ... } // código completo aqui
}
```

### ✔️ Como Validar

- [ ] Existe PLAN.md antes de código?
- [ ] Dev não está arquitetando?
- [ ] Executor não está redesenhando?
- [ ] Fluxo Plan→Exec→Refine seguido?

### ⚠️ Penalidade por Violação

- Confusão de responsabilidades
- Retrabalho por falta de planejamento
- Código mal estruturado

---

## REGRA 17: Protocolo de Handoff Entre Agents

### 📍 Fundamentação
**Blocos:** 15-16  
**Conteúdo Explícito:** Configuração de agentes no Trae.ai  
**Conteúdo Implícito:** Necessidade de comunicação estruturada entre agentes  
**Gap Identificado:** GAP-PROC-06, GAP-PROC-07, GAP-PROC-08, GAP-ARCH-01, GAP-ARCH-02

### 📜 Texto da Regra

```markdown
## 17. Protocolo de Handoff Entre Agents

- Handoff entre agentes deve usar formato **estruturado** (.task ou JSON).
- Toda task deve ter: `id`, `from`, `to`, `type`, `input`, `expected_output`, `validation_criteria`.
- Agent receptor deve **validar** que entendeu a task antes de executar.
- Se task for ambígua, receptor deve **solicitar clarificação** (volta para sender).
- Architect → Dev: passa **PLAN.md + contratos + critérios de aceitação**.
- Dev → Executor: passa **código gerado + lista de ajustes solicitados**.
- Executor → Architect: passa **código refinado + relatório de mudanças** para validação final.
- Implementar **approval gates**: Plan approval, Code review, Deploy approval.
- Em caso de erro, task retorna ao agente anterior com **feedback estruturado**.
```

### 🎯 Exemplos Práticos

**✅ Correto - Task Architect→Dev:**
```json
{
  "id": "task-001-catalog-module",
  "from": "architect",
  "to": "dev",
  "type": "implement_module",
  "timestamp": "2024-11-16T10:00:00Z",
  "input": {
    "plan": "docs/PLAN.md",
    "contracts": "docs/CONTRACTS.md",
    "dependencies": ["auth-module@1.2.0"]
  },
  "expected_output": {
    "files": [
      "src/catalog.service.ts",
      "src/catalog.controller.ts",
      "src/catalog.dto.ts",
      "migrations/001_create_models_table.sql",
      "tests/catalog.spec.ts"
    ],
    "tests_pass": true,
    "lint_pass": true
  },
  "validation_criteria": [
    "Todos os endpoints do contrato implementados",
    "Testes com coverage > 80%",
    "Zero warnings de lint",
    "Migrações aplicam sem erro"
  ],
  "approval_required": true
}
```

**✅ Correto - Validação antes de executar:**
```typescript
// Dev agent valida task
const validation = await devAgent.validateTask(task)
if (!validation.understood) {
  return {
    status: 'clarification_needed',
    questions: [
      'Qual ORM usar: Prisma ou TypeORM?',
      'Autenticação: JWT ou OAuth2?'
    ]
  }
}
// Só executa após validação OK
await devAgent.execute(task)
```

**❌ Errado - Handoff informal:**
```
"Architect para Dev: faz o módulo de catálogo aí"
// Vago, sem estrutura, sem critérios
```

### ✔️ Como Validar

- [ ] Tasks usam formato JSON estruturado?
- [ ] Validação implementada antes de execução?
- [ ] Approval gates existem?
- [ ] Feedback de erro é estruturado?

### ⚠️ Penalidade por Violação

- Interpretação errada de tasks
- Retrabalho por falta de clareza
- Impossível automatizar pipeline

---

## REGRA 18: Modularização Rigorosa

### 📍 Fundamentação
**Blocos:** 21, 27  
**Conteúdo Explícito:** Building Blocks, contratos, módulos plugáveis  
**Conteúdo Implícito:** Modularização extrema, cada módulo é um produto  
**Gap Identificado:** GAP-DOC-05, GAP-DOC-06, GAP-ARCH-08

### 📜 Texto da Regra

```markdown
## 18. Modularização Rigorosa

- Todo módulo **deve ter** contrato explícito de interface.
- Contrato deve definir: entradas, saídas, erros possíveis, eventos emitidos.
- Usar **versionamento semântico** (semver) obrigatório: MAJOR.MINOR.PATCH.
- Breaking changes **requerem** incremento de MAJOR version.
- Módulo só está "pronto" se tiver:
  - [ ] README.md com instalação e uso
  - [ ] Contrato documentado (API.md ou código TypeScript interface)
  - [ ] Exemplos funcionais (example/ ou docs/examples/)
  - [ ] Testes (coverage mínimo 70%)
  - [ ] Dockerfile (se aplicável)
  - [ ] CHANGELOG.md
- Módulo deve poder rodar **isoladamente** (sem depender de detalhes internos do core).
- Preferir **composição** sobre herança.
- Evitar **acoplamento** entre módulos (comunicação via contratos apenas).
```

### 🎯 Exemplos Práticos

**✅ Correto - Estrutura de módulo:**
```
obm-auth-module/
├── README.md              ✅
├── CHANGELOG.md           ✅
├── package.json           (version: 1.2.0)
├── src/
│   ├── contracts.ts       ✅ Interface pública
│   ├── auth.service.ts
│   └── auth.controller.ts
├── tests/                 ✅
│   └── auth.spec.ts
├── docs/
│   ├── API.md             ✅ Contrato documentado
│   └── examples/          ✅
│       └── basic-usage.ts
├── Dockerfile             ✅
└── docker-compose.yml
```

**✅ Correto - Contrato:**
```typescript
// contracts.ts
export interface IAuthModule {
  login(email: string, password: string): Promise<AuthResult>
  register(userData: UserData): Promise<User>
  validateToken(token: string): Promise<TokenValidation>
}

export type AuthResult = 
  | { success: true; token: string; user: User }
  | { success: false; error: AuthError }

export type AuthError = 
  | { code: 'INVALID_CREDENTIALS'; message: string }
  | { code: 'USER_NOT_FOUND'; message: string }
  | { code: 'ACCOUNT_LOCKED'; message: string }
```

**✅ Correto - Semver:**
```markdown
# CHANGELOG.md

## [2.0.0] - 2024-03-01 (BREAKING CHANGE)
- Changed: `login()` agora retorna `AuthResult` em vez de `string` token
- Reason: Melhor tratamento de erros

## [1.2.0] - 2024-02-15
- Added: Suporte a OAuth2
- No breaking changes

## [1.1.1] - 2024-02-10
- Fixed: Bug em token expiration
```

**❌ Errado - Módulo incompleto:**
```
bad-module/
├── src/
│   └── index.ts
└── package.json
// Falta: README, testes, docs, contrato, Dockerfile
```

### ✔️ Como Validar

- [ ] Módulo tem todos os itens do checklist?
- [ ] Contrato está documentado?
- [ ] Semver seguido?
- [ ] CHANGELOG atualizado?
- [ ] Testes com coverage > 70%?

### ⚠️ Penalidade por Violação

- Módulo não pode ser publicado
- Retrabalho até completude
- Bloqueio de merge

---

## REGRA 19: Clareza e Contextualização em Documentação

### 📍 Fundamentação
**Blocos:** 25-26  
**Conteúdo Explícito:** Sempre especificar contexto (FRONTEND, BACKEND, etc)  
**Conteúdo Implícito:** Repetição para clareza, orientação para iniciantes  
**Gap Identificado:** GAP-DOC-09, GAP-GOV-04

### 📜 Texto da Regra

```markdown
## 19. Clareza e Contextualização em Documentação

- **Sempre especificar contexto** no início de cada seção: FRONTEND, BACKEND, DEVOPS, etc.
- Repetir contexto é preferível a ambiguidade.
- Usar **exemplos práticos** sempre que possível.
- Evitar jargão sem explicação (ou linkar para glossário).
- Estrutura de doc deve ser:
  1. **O que é** (definição clara)
  2. **Para que serve** (use cases)
  3. **Como usar** (exemplos práticos)
  4. **Quando NÃO usar** (anti-patterns)
- Toda referência técnica deve ter **wikilink** para glossário.
- Nomes de arquivos devem indicar contexto: `BACKEND-Auth-Service.md`, `FRONTEND-Login-Component.md`.
- Em código, comentários devem explicar **por quê**, não **o quê**.
```

### 🎯 Exemplos Práticos

**✅ Correto - Doc com contexto:**
```markdown
# BACKEND - Autenticação JWT

## O que é
Módulo backend em **NestJS (TypeScript)** para autenticação via JWT.

## Para que serve
- Validar credenciais (email + senha)
- Gerar tokens JWT
- Validar tokens em requests subsequentes

## Como usar (BACKEND)
\`\`\`typescript
import { AuthModule } from '@obm/auth'

@Module({
  imports: [AuthModule.register({ jwtSecret: '...' })]
})
\`\`\`

## Como usar (FRONTEND)
\`\`\`typescript
const response = await fetch('/api/auth/login', {
  method: 'POST',
  body: JSON.stringify({ email, password })
})
const { token } = await response.json()
\`\`\`

## Quando NÃO usar
- ❌ Para autenticação OAuth2 (use `@obm/auth-oauth`)
- ❌ Para sessões server-side (use `@obm/session`)
```

**✅ Correto - Comentário explicando "por quê":**
```typescript
// Usamos bcrypt com cost 12 (não 10) porque dados sensíveis
// justificam o tradeoff de performance por segurança extra
const hash = await bcrypt.hash(password, 12)
```

**❌ Errado - Doc ambígua:**
```markdown
# Autenticação

Use o módulo de auth.
// Qual? Backend ou frontend? Que linguagem?
```

### ✔️ Como Validar

- [ ] Toda doc tem contexto explícito?
- [ ] Exemplos práticos presentes?
- [ ] Termos técnicos têm wikilinks?
- [ ] Nomes de arquivo indicam contexto?
- [ ] Seções: O que/Para que/Como/Quando NÃO?

### ⚠️ Penalidade por Violação

- Doc fica confusa
- Iniciantes não conseguem usar
- Retrabalho para clarificar

---

## REGRA 20: Consistência de Contexto de Agents

### 📍 Fundamentação
**Blocos:** 36  
**Conteúdo Explícito:** "Você se lembra de tudo que escreveu nesse chat?"  
**Conteúdo Implícito:** Necessidade de contexto persistente entre sessões  
**Gap Identificado:** GAP-GOV-06

### 📜 Texto da Regra

```markdown
## 20. Consistência de Contexto de Agents

- Agents devem manter **contexto persistente** entre sessões.
- Implementar **memória compartilhada** (Vector DB, Redis, ou arquivo de contexto).
- Toda decisão arquitetural importante deve ser **salva no contexto**.
- Agent deve **consultar contexto** antes de tomar decisões que possam contradizer o passado.
- Em caso de inconsistência detectada, agent deve **alertar** e pedir clarificação.
- Context file deve incluir:
  - Decisões arquiteturais (ADRs)
  - Módulos já implementados
  - Contratos estabelecidos
  - Padrões de código do projeto
  - Erros a evitar (learnings)
- Implementar **context pruning** para evitar overload (manter últimas 50 decisões relevantes).
```

### 🎯 Exemplos Práticos

**✅ Correto - Context file:**
```json
{
  "project": "orbit-core",
  "context_version": "1.0",
  "architectural_decisions": [
    {
      "id": "ADR-001",
      "date": "2024-11-01",
      "decision": "Usar NestJS para backend TS, não Express",
      "reasoning": "Melhor estrutura modular, DI built-in"
    },
    {
      "id": "ADR-002",
      "date": "2024-11-10",
      "decision": "Autenticação via JWT, não sessions",
      "reasoning": "Stateless, escalável, mobile-friendly"
    }
  ],
  "modules_implemented": [
    { "name": "auth", "version": "1.2.0", "status": "stable" },
    { "name": "catalog", "version": "0.5.0", "status": "beta" }
  ],
  "code_patterns": [
    "Sempre usar DTOs com class-validator",
    "Testes: arrange-act-assert pattern",
    "Nomenclatura: kebab-case para arquivos, PascalCase para classes"
  ],
  "learnings": [
    "Evitar dependências circulares entre módulos",
    "Sempre definir contrato antes de implementar"
  ]
}
```

**✅ Correto - Agent consultando contexto:**
```typescript
// Architect agent
const context = await loadContext()

// Verifica se decisão já foi tomada
const existingDecision = context.architectural_decisions
  .find(d => d.topic === 'authentication')

if (existingDecision) {
  console.log(`Decisão anterior: ${existingDecision.decision}`)
  console.log('Mantendo consistência...')
  // Segue decisão anterior
} else {
  // Nova decisão - salva no contexto
  await saveDecision({
    topic: 'authentication',
    decision: 'JWT',
    reasoning: '...'
  })
}
```

**❌ Errado - Agent sem memória:**
```
Agent Session 1: "Vamos usar JWT"
Agent Session 2: "Vamos usar sessions" // Inconsistente!
```

### ✔️ Como Validar

- [ ] Context file existe e está atualizado?
- [ ] Agent consulta contexto antes de decidir?
- [ ] Decisões importantes são salvas?
- [ ] Inconsistências são alertadas?

### ⚠️ Penalidade por Violação

- Inconsistências entre sessões
- Retrabalho por decisões contraditórias
- Perda de contexto crítico

---

## REGRA 21: Governança de Documentação

### 📍 Fundamentação
**Blocos:** 37-38  
**Conteúdo Explícito:** Solicitação de árvore completa, revisão final  
**Conteúdo Implícito:** Necessidade de processo estruturado para docs  
**Gap Identificado:** GAP-GOV-01, GAP-GOV-02, GAP-GOV-05, GAP-PROC-12

### 📜 Texto da Regra

```markdown
## 21. Governança de Documentação

- Toda mudança em RULES GLOBAL requer **aprovação explícita** via PR review.
- Documentação crítica (00-Config/, 05-IA-e-Agents/) requer **2 approvers**.
- Implementar **CODEOWNERS** file:
  - `00-Config/*` → @architect-lead
  - `05-IA-e-Agents/*` → @architect-lead, @ai-specialist
  - `02-Guia-para-Devs/*` → @tech-lead
- Manter **CHANGELOG-DOCS.md** com histórico de mudanças documentais.
- Versionamento de docs: usar tags Git (`docs-v1.0.0`, `docs-v1.1.0`).
- Processo de documentação:
  1. **Coleta**: Identificar necessidade (gap, insight, nova feature)
  2. **Draft**: Criar rascunho em branch
  3. **Review**: PR com pelo menos 1 reviewer
  4. **Approval**: Merge após aprovação
  5. **Publish**: Atualizar índice, notificar equipe
- **Revisão trimestral** obrigatória de toda documentação.
- Docs desatualizadas devem ser **marcadas** com warning ou **removidas**.
```

### 🎯 Exemplos Práticos

**✅ Correto - CODEOWNERS:**
```
# .github/CODEOWNERS

# Configuração crítica
/00-Config/*.md @martyn-architect @tech-lead

# Documentação de IA
/05-IA-e-Agents/*.md @martyn-architect @ai-specialist

# Guias de desenvolvimento
/02-Guia-para-Devs/*.md @tech-lead

# Qualquer mudança em RULES requer 2 approvers
/00-Config/03-RULES-GLOBAL.md @martyn-architect @tech-lead
```

**✅ Correto - CHANGELOG-DOCS.md:**
```markdown
# Changelog de Documentação

## [1.2.0] - 2024-11-16
### Adicionado
- Regras 13-21 em RULES GLOBAL
- Novo doc: 05-IA-e-Agents/13-Protocolo-de-Handoff-Entre-Agents.md

### Modificado
- Expandido: 05-IA-e-Agents/01-Arquitetura-de-Agents.md (adicionada matriz de decisão)

### Removido
- (nada)

## [1.1.0] - 2024-11-01
...
```

**✅ Correto - PR de doc:**
```
Title: [DOCS] Adicionar Regra 18 - Modularização

Reviewers: @tech-lead, @martyn-architect
Labels: documentation, rules

Description:
Proposta de nova regra sobre modularização rigorosa.

Checklist:
- [x] Regra fundamentada (blocos do dossier citados)
- [x] Exemplos práticos incluídos
- [x] Como validar definido
- [x] CHANGELOG-DOCS.md atualizado
```

**❌ Errado - Merge direto:**
```
git commit -m "adiciona regra nova"
git push origin main
// Sem review, sem aprovação
```

### ✔️ Como Validar

- [ ] CODEOWNERS configurado?
- [ ] PRs de docs têm reviewers apropriados?
- [ ] CHANGELOG-DOCS.md atualizado?
- [ ] Versão do docs incrementada (git tag)?
- [ ] Revisão trimestral agendada?

### ⚠️ Penalidade por Violação

- Docs descontroladas
- Qualidade inconsistente
- Impossível rastrear mudanças

---

## RESUMO DAS 9 NOVAS REGRAS

| # | Regra | Categoria | Prioridade | Blocos Origem |
|---|-------|-----------|------------|---------------|
| 13 | Open-Source Ético | Arquitetura | ⚡ Média | 17-20, 27 |
| 14 | Segurança de IA e API Keys | Segurança | 🔥 Alta | 01-11 |
| 15 | Auditoria de Agents | Segurança | 🔥 Alta | 11, 36 |
| 16 | Arquitetura Multi-Agents | Arquitetura | 🔥 Alta | 12-16, 27 |
| 17 | Protocolo de Handoff | Processo | 🔥 Alta | 15-16 |
| 18 | Modularização Rigorosa | Arquitetura | 🔥 Alta | 21, 27 |
| 19 | Clareza em Documentação | Documentação | ⚡ Média | 25-26 |
| 20 | Consistência de Contexto | Governança | ⚡ Média | 36 |
| 21 | Governança de Documentação | Governança | 🔥 Alta | 37-38 |

---

## IMPACTO DAS NOVAS REGRAS

### Cobertura de Gaps

Das 47 gaps identificados:
- **Resolvidos diretamente:** 32 gaps (68%)
- **Parcialmente resolvidos:** 11 gaps (23%)
- **Não resolvidos (fora de escopo de regras):** 4 gaps (9%)

### Fortalecimento de Áreas

**Segurança:** +66%
- Antes: 1 regra (R3)
- Depois: 3 regras (R3, R14, R15)

**Arquitetura de IA:** +∞
- Antes: 0 regras
- Depois: 3 regras (R16, R17, R20)

**Modularização:** +100%
- Antes: 1 regra (R2)
- Depois: 2 regras (R2, R18)

**Documentação:** +200%
- Antes: 1 regra (R4)
- Depois: 3 regras (R4, R19, R21)

---

## ORDEM DE IMPLEMENTAÇÃO SUGERIDA

### Fase 1: Fundacional (Sprint 1)
1. **Regra 16** - Arquitetura Multi-Agents (base de tudo)
2. **Regra 18** - Modularização Rigorosa (metodologia core)
3. **Regra 21** - Governança de Documentação (processo de manutenção)

### Fase 2: Segurança (Sprint 2)
4. **Regra 14** - Segurança de IA (proteção de keys)
5. **Regra 15** - Auditoria de Agents (rastreabilidade)

### Fase 3: Operacional (Sprint 3)
6. **Regra 17** - Protocolo de Handoff (comunicação entre agents)
7. **Regra 19** - Clareza em Documentação (qualidade docs)
8. **Regra 20** - Consistência de Contexto (memória agents)

### Fase 4: Complementar (Sprint 4)
9. **Regra 13** - Open-Source Ético (curadoria libs)

---

## CHECKLIST DE APROVAÇÃO

Antes de implementar estas regras em `00-Config/03-RULES-GLOBAL.md`:

- [ ] Análise profunda do dossier concluída
- [ ] Gaps identificados e documentados
- [ ] Insights extraídos e validados
- [ ] Cada regra fundamentada com blocos de origem
- [ ] Exemplos práticos fornecidos
- [ ] Validação de conformidade definida
- [ ] Penalidades por violação especificadas
- [ ] Ordem de implementação definida
- [ ] Aprovação de @martyn-architect obtida
- [ ] Aprovação de @tech-lead obtida
- [ ] CHANGELOG-DOCS.md preparado

---

## PRÓXIMOS PASSOS

Após aprovação:

1. **Criar PR** com adição das Regras 13-21 em `00-Config/03-RULES-GLOBAL.md`
2. **Criar documentos complementares:**
   - `05-IA-e-Agents/09-Gestao-de-Custos-e-Uso.md`
   - `05-IA-e-Agents/12-Governanca-e-Seguranca-de-Agents.md`
   - `05-IA-e-Agents/13-Protocolo-de-Handoff-Entre-Agents.md`
   - `02-Guia-para-Devs/08-Contratos-e-Interfaces-de-Modulos.md`
   - `00-Config/09-Governanca-de-Documentacao.md`
   - E outros conforme MATRIZ-BLOCOS-REGRAS-DOCS.md
3. **Atualizar CODEOWNERS**
4. **Criar CHANGELOG-DOCS.md**
5. **Notificar equipe** sobre novas regras
6. **Agendar revisão trimestral** de documentação

---

**Recomendações concluídas em:** 2025-11-16  
**Status:** ✅ AGUARDANDO APROVAÇÃO  
**Requer aprovação de:** Responsável pelo projeto (conforme Regra 5)
