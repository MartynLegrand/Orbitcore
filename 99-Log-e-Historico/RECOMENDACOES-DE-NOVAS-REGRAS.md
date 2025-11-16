# RECOMENDAÇÕES DE NOVAS REGRAS (13-21)

**Data:** 2025-11-16  
**Relacionado a:** ANALYSIS-DOSSIER-PROFUNDA.md  
**Destino:** 00-Config/03-RULES-GLOBAL.md  
**Status:** ✅ PRONTO PARA APROVAÇÃO E IMPLEMENTAÇÃO

---

## 📋 SUMÁRIO

Este documento especifica 9 novas regras (13-21) descobertas através da análise profunda do dossier. Cada regra inclui:
- Justificação (onde no dossier aparece)
- Conteúdo completo da regra
- Exemplos práticos
- Relação com regras existentes
- Impacto esperado

---

## RULE 13: Gestão de Custos de IA

### Justificação
**Blocos:** 01-03, 11-16  
**Descoberta:** Chat discute extensivamente custos de OpenAI, mas não há regra formal

### Conteúdo da Regra

**Título:** Gestão de Custos de IA

**Princípio:**  
Todo uso de serviços de IA (OpenAI, Anthropic, etc.) deve ser monitorado, otimizado e ter custos controlados.

**Obrigações:**
- Monitorar uso e custos de APIs de IA em tempo real
- Estabelecer thresholds e alertas automáticos de custo
- Documentar custos esperados por módulo/feature
- Otimizar prompts e uso de tokens sistematicamente
- Escolher modelo apropriado por tarefa (não usar GPT-5 Pro onde GPT-3.5 resolve)
- Implementar caching quando possível (prompt caching, result caching)
- Revisar custos mensalmente e otimizar

**Métricas:**
- Custo por request
- Custo por feature/módulo
- Tokens consumidos por operação
- Cache hit rate

**Exemplos:**
```typescript
// BOM: Escolher modelo apropriado
const simpleTask = await openai.complete({
  model: 'gpt-3.5-turbo', // Modelo mais barato para tarefa simples
  prompt: '...'
});

const complexTask = await openai.complete({
  model: 'gpt-5-pro', // Modelo caro apenas quando necessário
  prompt: '...'
});

// BOM: Implementar caching
const cachedResult = await cache.get(promptHash);
if (cachedResult) return cachedResult;

const result = await openai.complete({...});
await cache.set(promptHash, result, '1h');
```

```yaml
# BOM: Alertas de custo
alerts:
  - name: OpenAI Daily Cost
    threshold: $50
    action: notify_team
  - name: OpenAI Monthly Cost
    threshold: $1000
    action: block_non_critical
```

**Relaciona-se com:**
- RULE 3 (Segurança) - gestão de API keys
- RULE 10 (Validação) - monitoramento

**Documentação:**
- `05-IA-e-Agents/09-Otimizacao-de-Custos.md`
- `07-Receitas-e-Playbooks/05-Cost-Optimization.md`

---

## RULE 14: Integração de Serviços IA

### Justificação
**Blocos:** 01-10  
**Descoberta:** Múltiplas discussões sobre integração OpenAI mas sem padronização

### Conteúdo da Regra

**Título:** Integração de Serviços IA

**Princípio:**  
Integrações com APIs de IA devem seguir padrões de segurança, confiabilidade e observabilidade.

**Obrigações:**
- Gestão segura de API keys via .env ou secret manager (nunca hardcode)
- Implementar retry logic com exponential backoff
- Implementar rate limiting para respeitar limites da API
- Definir fallback strategies (modelo alternativo, cached response, error gracioso)
- Documentar endpoints e modelos utilizados
- Implementar circuit breakers para proteção contra falhas em cascata
- Logar requests e responses (sem expor dados sensíveis)
- Monitorar latências e error rates

**Padrão de Integração:**
```typescript
// Configuração
interface AIConfig {
  provider: 'openai' | 'anthropic';
  apiKey: string; // De variável de ambiente
  model: string;
  timeout: number;
  maxRetries: number;
  fallbackModel?: string;
}

// Client com retry e circuit breaker
class AIClient {
  constructor(private config: AIConfig) {
    this.client = new OpenAI({ apiKey: config.apiKey });
    this.circuitBreaker = new CircuitBreaker(this.call, {
      timeout: config.timeout,
      errorThreshold: 50,
      resetTimeout: 30000
    });
  }

  async complete(prompt: string): Promise<string> {
    try {
      return await this.circuitBreaker.fire(prompt);
    } catch (error) {
      if (this.config.fallbackModel) {
        return await this.fallback(prompt);
      }
      throw error;
    }
  }

  private async call(prompt: string) {
    const result = await retry(
      () => this.client.complete({ model: this.config.model, prompt }),
      { retries: this.config.maxRetries, factor: 2 }
    );
    return result;
  }
}
```

**Segurança:**
```env
# .env - NUNCA commitar
OPENAI_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-ant-...
```

```typescript
// BOM: Ler de env
const apiKey = process.env.OPENAI_API_KEY;
if (!apiKey) throw new Error('OPENAI_API_KEY not set');

// RUIM: Hardcode
const apiKey = 'sk-proj-...'; // NUNCA FAZER ISSO
```

**Relaciona-se com:**
- RULE 2 (Contratos e Integração)
- RULE 3 (Segurança)
- RULE 10 (Validação e Confiabilidade)
- RULE 13 (Gestão de Custos)

**Documentação:**
- `02-Guia-para-Devs/05-Integracao-APIs-IA.md`
- `05-IA-e-Agents/02-GPT-5-Pro-Integration.md`

---

## RULE 15: Critérios de Seleção de Tecnologias

### Justificação
**Blocos:** 17-20, 21-27  
**Descoberta:** Discussão sobre repos 3D open-source mas sem critérios claros de seleção

### Conteúdo da Regra

**Título:** Critérios de Seleção de Tecnologias

**Princípio:**  
Toda adoção de nova tecnologia (biblioteca, framework, ferramenta) deve ser avaliada contra critérios objetivos.

**Critérios Obrigatórios:**

1. **Maturidade do Projeto**
   - Commits recentes (último commit < 6 meses)
   - Releases regulares
   - Issues sendo respondidas
   - Stars/forks (indicadores de adoção)

2. **Comunidade e Suporte**
   - Tamanho da comunidade
   - Atividade (Discord, GitHub Discussions, etc.)
   - Documentação de qualidade
   - Tutoriais e exemplos

3. **Performance e Escalabilidade**
   - Benchmarks disponíveis
   - Casos de uso em produção
   - Load testing results
   - Resource footprint

4. **Fit com Stack Existente**
   - Compatibilidade com TypeScript/Python/etc.
   - Integração com ferramentas existentes (Docker, etc.)
   - Dependencies footprint
   - Build/bundle size

5. **Licensing**
   - Preferência: MIT, Apache 2.0
   - Aceitável: BSD, ISC
   - Evitar: GPL (pode contaminar código proprietário)
   - Verificar compatibilidade com uso comercial

6. **Segurança**
   - CVEs conhecidas?
   - Security audit recente?
   - Dependency vulnerabilities?
   - Maintained security policy?

**Checklist de Avaliação:**
```yaml
tecnologia: nome-da-lib
versao: 1.2.3
avaliacao:
  maturidade:
    ultimo_commit: 2025-11-10
    releases_ano: 12
    issues_abertas: 45
    issues_respondidas: 90%
    score: 8/10
  comunidade:
    stars: 15000
    forks: 2000
    contributors: 150
    documentacao: excelente
    score: 9/10
  performance:
    benchmarks: disponíveis
    producao: sim
    footprint: baixo
    score: 8/10
  fit_stack:
    typescript: sim
    docker: sim
    dependencies: 5
    bundle_size: 50KB
    score: 9/10
  licensing:
    licenca: MIT
    comercial: sim
    score: 10/10
  seguranca:
    cves: 0
    audit: 2025-01
    vulnerabilities: 0
    score: 10/10
decisao: APROVAR
score_total: 54/60 (90%)
```

**Threshold de Aprovação:**
- Score > 70%: Aprovado
- Score 50-70%: Revisão adicional necessária
- Score < 50%: Rejeitar

**Relaciona-se com:**
- RULE 6 (Stack Fixa)
- RULE 7 (Conversão de Open-Source)
- RULE 13 (Open-Source Ético) - proposta

**Documentação:**
- `08-Referencias-Externas/05-Criterios-Selecao-3D.md`
- Template de avaliação reutilizável

---

## RULE 16: Versionamento de Módulos

### Justificação
**Blocos:** 21 (metodologia modular menciona contratos mas não versionamento)  
**Descoberta:** Necessário para ecossistema de módulos funcionar

### Conteúdo da Regra

**Título:** Versionamento de Módulos

**Princípio:**  
Todos os módulos OBM devem seguir semantic versioning e manter changelog atualizado.

**Semantic Versioning (SemVer):**
```
MAJOR.MINOR.PATCH
```

- **MAJOR:** Breaking changes (incompatível com versão anterior)
- **MINOR:** Novas features (backward compatible)
- **PATCH:** Bug fixes (backward compatible)

**Exemplos:**
- `1.0.0` → `1.0.1`: Bug fix, atualizar é seguro
- `1.0.1` → `1.1.0`: Nova feature, atualizar é seguro
- `1.1.0` → `2.0.0`: Breaking change, requer migration

**Obrigações:**

1. **CHANGELOG.md obrigatório**
```markdown
# Changelog

## [2.0.0] - 2025-11-16

### Breaking Changes
- Renamed `authenticate()` to `login()` for clarity
- Changed response format of `/api/users`

### Migration Guide
See MIGRATION-2.0.md

## [1.2.0] - 2025-11-01

### Added
- New method `refreshToken()`
- Support for OAuth2

### Fixed
- Memory leak in session manager
```

2. **Git Tags para releases**
```bash
git tag -a v1.2.0 -m "Release 1.2.0: Add OAuth2 support"
git push origin v1.2.0
```

3. **package.json / pyproject.toml**
```json
{
  "name": "@obm/auth",
  "version": "1.2.0",
  "description": "Authentication module"
}
```

4. **Breaking Changes: Migration Guide obrigatório**
```markdown
# MIGRATION-2.0.md

## Migrating from 1.x to 2.0

### API Changes

**Before (1.x):**
```typescript
const user = await auth.authenticate(email, password);
```

**After (2.0):**
```typescript
const user = await auth.login(email, password);
```

### Database Migrations

Run: `npx prisma migrate deploy`
```

5. **Backward Compatibility**
- MINOR e PATCH devem ser backward compatible
- Deprecate antes de remover (ver RULE 17)

**Relaciona-se com:**
- RULE 2 (Contratos)
- RULE 5 (Fonte da Verdade)
- RULE 17 (Deprecation) - proposta
- RULE 18 (Modularização)

**Documentação:**
- Incluir em `02-Guia-para-Devs/02-Criando-Modulos-OBM.md`

---

## RULE 17: Deprecation Strategy

### Justificação
**Blocos:** 21 (implícito na necessidade de evolução de módulos)  
**Descoberta:** Módulos evoluem, features antigas precisam ser removidas graciosamente

### Conteúdo da Regra

**Título:** Deprecation Strategy

**Princípio:**  
Features, APIs ou módulos devem ser removidos gradualmente, com aviso prévio e suporte durante transição.

**Processo de Deprecation:**

**1. Anúncio (Version N)**
```typescript
/**
 * @deprecated Use `login()` instead. Will be removed in v3.0
 */
export function authenticate(email: string, password: string) {
  console.warn('authenticate() is deprecated, use login() instead');
  return this.login(email, password);
}

export function login(email: string, password: string) {
  // Nova implementação
}
```

**2. Período de Transição (Mínimo 3 meses ou 1 MINOR version)**
- Feature marcada como deprecated
- Logs de warning quando usada
- Migration guide disponível
- Suporte mantido

**3. Sunset Announcement (Version N+1)**
```markdown
# CHANGELOG.md

## [2.5.0] - 2025-12-01

### Deprecated
- `authenticate()` will be REMOVED in v3.0.0 (January 2026)
- Please migrate to `login()` - see MIGRATION-3.0.md

## [3.0.0] - 2026-01-15

### REMOVED
- `authenticate()` method (deprecated since 2.0.0)
```

**4. Remoção (Version N+2 - MAJOR bump)**
- Feature removida completamente
- Testes garantem que não há usos internos
- Migration guide ainda disponível

**Timeline Mínimo:**
- Features públicas: 6 meses ou 2 MINOR versions
- Features internas: 3 meses ou 1 MINOR version
- APIs experimentais: 1 mês (devem ser marcadas como experimental)

**Migration Guide Obrigatório:**
```markdown
# MIGRATION-3.0.md

## Removed: authenticate()

**What changed:**  
The `authenticate()` method has been removed. Use `login()` instead.

**Before:**
```typescript
const user = await auth.authenticate(email, password);
```

**After:**
```typescript
const user = await auth.login(email, password);
```

**Why:**  
Clearer naming and consistent with industry standards.

**Need help?**  
Contact: dev-team@example.com
```

**Experimental Features:**
```typescript
/**
 * @experimental This API may change without notice.
 * Not recommended for production use.
 */
export function experimentalFeature() {
  // ...
}
```

**Relaciona-se com:**
- RULE 16 (Versionamento)
- RULE 18 (Modularização)
- RULE 5 (Fonte da Verdade)

**Documentação:**
- Incluir em `02-Guia-para-Devs/02-Criando-Modulos-OBM.md`

---

## RULE 18: Modularização

### Justificação
**Blocos:** 21-27 (extensa discussão sobre metodologia modular)  
**Descoberta:** Regra existia implicitamente mas não estava documentada formalmente

**NOTA:** Esta regra JÁ EXISTE no sistema mas não estava na lista de 12 regras do arquivo RULES-GLOBAL.md. A análise do dossier revelou sua importância e necessidade de formalização.

### Conteúdo da Regra

**Título:** Modularização

**Princípio:**  
Todo código deve ser organizado em módulos coesos, com baixo acoplamento e interfaces bem definidas.

**Princípios SOLID Aplicados:**

1. **Single Responsibility Principle (SRP)**
   - Cada módulo tem UMA responsabilidade clara
   - Exemplo: `obm-auth` cuida APENAS de autenticação, não de profile management

2. **Open/Closed Principle (OCP)**
   - Módulos abertos para extensão, fechados para modificação
   - Use interfaces e dependency injection

3. **Liskov Substitution Principle (LSP)**
   - Implementações devem ser intercambiáveis
   - Contratos devem ser respeitados

4. **Interface Segregation Principle (ISP)**
   - Interfaces pequenas e específicas
   - Cliente não deve depender de métodos que não usa

5. **Dependency Inversion Principle (DIP)**
   - Depender de abstrações, não de implementações concretas
   - Usar dependency injection

**Características de Bom Módulo:**

- **Alta Coesão:** Elementos relacionados juntos
- **Baixo Acoplamento:** Dependências mínimas entre módulos
- **Interface Clara:** API bem definida e documentada
- **Testável:** Pode ser testado independentemente
- **Documentado:** README, API docs, exemplos

**Estrutura de Módulo OBM:**
```
obm-auth/
├── src/
│   ├── index.ts              # Exports públicos
│   ├── auth.service.ts       # Lógica principal
│   ├── auth.controller.ts    # HTTP endpoints
│   ├── auth.types.ts         # Types/interfaces
│   └── __tests__/
├── docs/
│   ├── README.md
│   ├── API.md
│   ├── ARCHITECTURE.md
│   └── INTEGRATION.md
├── examples/
│   └── basic-usage.ts
├── package.json
├── tsconfig.json
└── CHANGELOG.md
```

**Contrato de Módulo:**
```typescript
// auth.types.ts - Interface pública
export interface IAuthService {
  login(email: string, password: string): Promise<AuthResult>;
  logout(userId: string): Promise<void>;
  validateToken(token: string): Promise<boolean>;
}

export interface AuthResult {
  user: User;
  token: string;
  expiresAt: Date;
}

// auth.service.ts - Implementação
export class AuthService implements IAuthService {
  constructor(
    private config: AuthConfig,
    private db: IDatabase,        // Dependency injection
    private crypto: ICryptoService // Dependency injection
  ) {}

  async login(email: string, password: string): Promise<AuthResult> {
    // Implementação
  }
}

// index.ts - Exports públicos
export { IAuthService, AuthResult } from './auth.types';
export { AuthService } from './auth.service';
export { AuthConfig } from './auth.config';
```

**Anti-patterns a Evitar:**

❌ **God Module:** Módulo que faz tudo
```typescript
// RUIM: um módulo que faz auth + profile + notifications + billing
class UserSystemModule {
  login() {}
  updateProfile() {}
  sendEmail() {}
  chargeCreditCard() {}
}
```

✅ **Módulos Separados:**
```typescript
// BOM: módulos separados e coesos
class AuthModule { login() {} }
class ProfileModule { updateProfile() {} }
class NotificationModule { sendEmail() {} }
class BillingModule { chargeCreditCard() {} }
```

❌ **Tight Coupling:** Módulos dependem de implementação
```typescript
// RUIM: dependência direta de implementação
class OrderService {
  private stripe = new StripePayment(); // Hard dependency
}
```

✅ **Dependency Injection:**
```typescript
// BOM: dependência de interface
class OrderService {
  constructor(private payment: IPaymentService) {} // Interface
}
```

**Relaciona-se com:**
- RULE 1 (Nomenclatura) - prefixo obm-*
- RULE 2 (Contratos e Integração)
- RULE 6 (Stack Fixa)
- RULE 16 (Versionamento)
- RULE 17 (Deprecation)

**Documentação:**
- `02-Guia-para-Devs/01-Metodologia-Modular.md` (criar)
- `02-Guia-para-Devs/02-Criando-Modulos-OBM.md` (criar)

---

## RULE 19: Papéis de Agents

### Justificação
**Blocos:** 11-16 (extensa discussão sobre arquitetura de 3 agents)  
**Descoberta:** Papéis claros mas não formalizados como regra

### Conteúdo da Regra

**Título:** Papéis de Agents

**Princípio:**  
O desenvolvimento assistido por IA utiliza 3 agents especializados com papéis e responsabilidades claramente definidos.

**Agent 1: GPT-5 Pro Architect**

**Especialidade:** Planejamento, Arquitetura, Design de Sistema

**Responsabilidades:**
- Analisar requisitos e propor soluções
- Criar arquitetura de alto nível
- Definir estrutura de pastas e módulos
- Escrever especificações técnicas detalhadas
- Revisar qualidade de implementações
- Validar que requisitos foram atendidos
- Criar planos de execução para outros agents

**Quando usar:**
- Início de novo projeto ou módulo
- Decisões arquiteturais complexas
- Review de qualidade
- Planejamento de refactoring grande
- Validação de implementação

**Output típico:**
- ARCHITECTURE.md
- PLAN.md (plano de execução)
- ACCEPTANCE.md (critérios de aceitação)
- Especificações técnicas
- Code review reports

---

**Agent 2: GPT-5.1 Codex Dev**

**Especialidade:** Implementação Massiva de Código

**Responsabilidades:**
- Implementar planos do Architect
- Gerar backend completo (múltiplos arquivos)
- Gerar frontend completo (componentes, páginas, etc.)
- Criar migrations de banco de dados
- Escrever testes (unit, integration)
- Configurar Docker, CI/CD
- Gerar boilerplate e scaffolding

**Quando usar:**
- Implementação de novos módulos/features
- Geração de múltiplos arquivos
- Criação de CRUD completo
- Setup inicial de projeto
- Geração de testes

**Output típico:**
- Múltiplos arquivos de código
- Testes automatizados
- Configurações (Docker, CI/CD)
- Migrations
- Documentação de código

---

**Agent 3: GPT-5 Executor**

**Especialidade:** Ajustes, Otimizações, Tarefas Médias

**Responsabilidades:**
- Fazer ajustes e refinamentos
- Otimizar código existente
- Corrigir bugs
- Adicionar features pequenas
- Atualizar documentação
- Refactoring localizado
- Manutenção e melhorias

**Quando usar:**
- Bug fixes
- Pequenas melhorias
- Otimizações de performance
- Atualização de docs
- Ajustes de estilo
- Refactoring de função/classe específica

**Output típico:**
- Arquivos individuais modificados
- Bug fixes
- Documentação atualizada
- Melhorias pontuais

---

**Workflow de Delegação:**

```mermaid
graph TD
    A[Requisito] --> B[Architect: Planejar]
    B --> C[Dev: Implementar]
    C --> D[Executor: Ajustar]
    D --> E[Architect: Validar]
    E -->|Aprovado| F[Done]
    E -->|Rejeitar| C
```

**Critérios de Delegação:**

| Situação | Agent |
|----------|-------|
| Nova feature complexa | Architect → Dev → Executor |
| Feature simples | Dev → Executor |
| Bug fix | Executor |
| Refactoring grande | Architect → Dev |
| Refactoring pequeno | Executor |
| Arquitetura nova | Architect |
| Review de qualidade | Architect |

**Comunicação Entre Agents:**  
Ver RULE 20 (Protocolo de Handoff)

**Relaciona-se com:**
- RULE 12 (Regras para Tasks)
- RULE 20 (Protocolo de Handoff)
- RULE 21 (Configuração de Ambiente)

**Documentação:**
- `05-IA-e-Agents/01-Arquitetura-de-Agents.md` (update)
- `05-IA-e-Agents/02-GPT5-Pro-Architect-Agent.md` (update)
- `05-IA-e-Agents/03-GPT5-1-Codex-Dev-Agent.md` (update)
- `05-IA-e-Agents/04-GPT5-Executor-Agent.md` (update)

---

## RULE 20: Protocolo de Handoff

### Justificação
**Blocos:** 11-16 (mencionado implicitamente, formato .TASK citado)  
**Descoberta:** Protocolo necessário mas nunca especificado

### Conteúdo da Regra

**Título:** Protocolo de Handoff

**Princípio:**  
Comunicação entre agents deve seguir protocolo estruturado usando formato .TASK para garantir clareza e rastreabilidade.

**Formato .TASK:**

```yaml
# task-001.yaml
task_id: "task-001-implement-auth-module"
created_at: "2025-11-16T10:00:00Z"
from_agent: "architect"
to_agent: "dev"
status: "pending" # pending | in_progress | completed | failed

objective: |
  Implementar módulo de autenticação completo com JWT, 
  suporte a OAuth2 e refresh tokens.

context: |
  Este módulo será usado por todos os apps do ecossistema.
  Deve ser pluggável e suportar múltiplos providers.

inputs:
  files:
    - "docs/ARCHITECTURE.md"
    - "docs/API-SPEC.md"
  data:
    stack: "NestJS + Prisma + Redis"
    database: "PostgreSQL"
    
outputs_expected:
  files:
    - "src/auth.module.ts"
    - "src/auth.service.ts"
    - "src/auth.controller.ts"
    - "src/strategies/*.ts"
    - "prisma/migrations/*"
    - "tests/**/*.spec.ts"
  artifacts:
    - "Docker container configurado"
    - "Testes passando"
    - "API documentada (Swagger)"

acceptance_criteria:
  - "Login com email/password funciona"
  - "OAuth2 com Google funciona"
  - "Refresh token funciona"
  - "JWT validation funciona"
  - "Testes com coverage > 80%"
  - "Documentação completa"
  - "Docker compose up funciona"

priority: "high" # high | medium | low
estimated_time: "4 hours"
deadline: "2025-11-16T18:00:00Z"

dependencies:
  - task_id: "task-000-setup-project"
    status: "completed"

notes: |
  - Usar bcrypt para hash de senhas
  - JWT secret deve vir de .env
  - Implementar rate limiting
  - Adicionar audit log
```

**Lifecycle de Task:**

1. **Criação (Architect)**
```typescript
const task = createTask({
  from: 'architect',
  to: 'dev',
  objective: '...',
  // ...
});
await saveTask(task);
await notifyAgent('dev', task);
```

2. **Aceitação (Dev)**
```typescript
const task = await getTask('task-001');
task.status = 'in_progress';
task.started_at = new Date();
await updateTask(task);
```

3. **Progress Updates**
```typescript
// Dev reporta progresso
await addTaskUpdate(task.id, {
  progress: 50,
  message: 'Backend completo, iniciando testes',
  files_completed: ['src/auth.service.ts', 'src/auth.controller.ts']
});
```

4. **Completion (Dev)**
```typescript
task.status = 'completed';
task.completed_at = new Date();
task.artifacts = [
  'src/auth.module.ts',
  'src/auth.service.ts',
  // ...
];
await updateTask(task);
await notifyAgent('architect', task); // Para validação
```

5. **Validation (Architect)**
```typescript
const task = await getTask('task-001');
const valid = await validateTask(task);
if (valid) {
  task.status = 'approved';
} else {
  task.status = 'needs_revision';
  task.feedback = 'Falta implementar OAuth2 Google';
  await notifyAgent('dev', task);
}
```

**Error Handling:**

```yaml
# task com erro
task_id: "task-001"
status: "failed"
error:
  code: "IMPLEMENTATION_ERROR"
  message: "Testes falhando - JWT validation"
  details: |
    3 testes falhando em auth.service.spec.ts
    Ver logs em artifacts/test-output.log
  recovery_strategy: "fix_tests"
  escalate_to: "architect" # Se Dev não conseguir resolver
```

**Handoff Entre Agents:**

```mermaid
sequenceDiagram
    Architect->>Dev: .TASK file
    Dev->>Dev: Implementar
    Dev-->>Architect: Progress updates
    Dev->>Architect: Completed .TASK
    Architect->>Architect: Validar
    alt Aprovado
        Architect->>Executor: .TASK ajustes
        Executor->>Executor: Refinar
        Executor->>Architect: Done
    else Rejeitar
        Architect->>Dev: Feedback + .TASK
        Dev->>Dev: Corrigir
    end
```

**Benefícios:**
- Comunicação clara e estruturada
- Rastreabilidade completa
- Fácil debugging de problemas
- Metrics automáticas (tempo, success rate)
- Auditoria de trabalho de agents

**Relaciona-se com:**
- RULE 12 (Regras para Tasks)
- RULE 19 (Papéis de Agents)
- RULE 5 (Fonte da Verdade)

**Documentação:**
- `05-IA-e-Agents/11-Protocolo-Handoff.md` (criar)
- `05-IA-e-Agents/01-Arquitetura-de-Agents.md` (update)

---

## RULE 21: Configuração de Ambiente

### Justificação
**Blocos:** 15-16, 34 (configuração de Trae e agents)  
**Descoberta:** Setup crítico mas não documentado como regra

### Conteúdo da Regra

**Título:** Configuração de Ambiente

**Princípio:**  
Ambiente de desenvolvimento deve ser configurável, reproduzível e validável, com documentação completa de setup.

**Componentes de Ambiente:**

**1. Trae IDE (Agent Platform)**

```yaml
# .trae/config.yaml
agents:
  - name: "GPT-5 Pro Architect"
    provider: "openai"
    model: "gpt-5-pro"
    model_id: "gpt-5-pro-2025-10-06"
    api_key_env: "OPENAI_API_KEY_ARCHITECT"
    permissions:
      read: true
      write: true
      request: true
    role: "architect"
    
  - name: "GPT-5.1 Codex Dev"
    provider: "openai"
    model: "gpt-5.1-codex"
    model_id: "gpt-5.1-codex-2025-10-06"
    api_key_env: "OPENAI_API_KEY_DEV"
    permissions:
      read: true
      write: true
      request: true
    role: "dev"
    
  - name: "GPT-5 Executor"
    provider: "openai"
    model: "gpt-5"
    model_id: "gpt-5-2025-10-06"
    api_key_env: "OPENAI_API_KEY_EXECUTOR"
    permissions:
      read: true
      write: true
      request: false
    role: "executor"
```

**2. Variáveis de Ambiente**

```env
# .env.local (NUNCA commitar)

# OpenAI Keys (um por agent para rastreamento)
OPENAI_API_KEY_ARCHITECT=sk-proj-...
OPENAI_API_KEY_DEV=sk-proj-...
OPENAI_API_KEY_EXECUTOR=sk-proj-...

# Database
DATABASE_URL=postgresql://user:pass@localhost:5432/dbname
REDIS_URL=redis://localhost:6379

# App Secrets
JWT_SECRET=your-secret-key-here
SESSION_SECRET=another-secret

# Feature Flags
ENABLE_OAUTH=true
ENABLE_ANALYTICS=false

# Environment
NODE_ENV=development
LOG_LEVEL=debug
```

**3. Setup Script**

```bash
#!/bin/bash
# scripts/setup-dev.sh

echo "🚀 Setup de Ambiente OBM..."

# Check pre-requisitos
command -v node >/dev/null 2>&1 || { echo "Node.js não instalado"; exit 1; }
command -v docker >/dev/null 2>&1 || { echo "Docker não instalado"; exit 1; }

# Install dependencies
echo "📦 Instalando dependências..."
npm install

# Setup database
echo "🗄️  Setup database..."
docker-compose up -d postgres redis
npx prisma migrate deploy
npx prisma db seed

# Validar env vars
echo "✅ Validando variáveis de ambiente..."
node scripts/validate-env.js

# Health checks
echo "🏥 Health checks..."
curl -f http://localhost:5432 || echo "PostgreSQL não está rodando"
curl -f http://localhost:6379 || echo "Redis não está rodando"

echo "✅ Setup completo!"
echo "Execute: npm run dev"
```

**4. Validação de Ambiente**

```typescript
// scripts/validate-env.ts
const requiredVars = [
  'OPENAI_API_KEY_ARCHITECT',
  'OPENAI_API_KEY_DEV',
  'DATABASE_URL',
  'JWT_SECRET'
];

const missing = requiredVars.filter(v => !process.env[v]);

if (missing.length > 0) {
  console.error('❌ Missing environment variables:', missing);
  console.error('Copy .env.example to .env.local and fill in values');
  process.exit(1);
}

console.log('✅ Environment variables validated');
```

**5. Troubleshooting Guide**

```markdown
# TROUBLESHOOTING.md

## Trae não conecta aos agents

**Sintoma:** "API key inválida" ou "Connection failed"

**Soluções:**
1. Verificar .env.local tem as keys corretas
2. Verificar permissões no OpenAI dashboard
3. Verificar rate limits não foram excedidos
4. Tentar regenerar API key

## Database connection failed

**Sintoma:** "ECONNREFUSED localhost:5432"

**Soluções:**
1. `docker-compose up postgres`
2. Verificar DATABASE_URL em .env.local
3. Verificar firewall não está bloqueando
```

**Checklist de Setup:**
- [ ] Node.js >= 18 instalado
- [ ] Python >= 3.10 instalado (se usar FastAPI)
- [ ] Docker e Docker Compose instalados
- [ ] Trae IDE instalado
- [ ] .env.local criado e preenchido
- [ ] Dependencies instaladas (`npm install`)
- [ ] Database rodando (`docker-compose up -d`)
- [ ] Migrations aplicadas (`npx prisma migrate deploy`)
- [ ] Health checks passando
- [ ] Agents configurados no Trae
- [ ] Teste de integração passa (`npm test`)

**Relaciona-se com:**
- RULE 3 (Segurança) - gestão de secrets
- RULE 19 (Papéis de Agents)
- RULE 20 (Protocolo de Handoff)

**Documentação:**
- `02-Guia-para-Devs/06-Setup-Trae-Agents.md` (criar)
- `07-Receitas-e-Playbooks/02-Configurar-Agents-Trae.md` (criar)
- `README.md` (update com setup instructions)

---

## 📊 RESUMO DAS NOVAS REGRAS

| Rule | Título | Prioridade | Blocos Fonte | Impacto |
|------|--------|------------|--------------|---------|
| 13 | Gestão de Custos de IA | ALTA | 01-03, 11-16 | Controle de custos |
| 14 | Integração de Serviços IA | ALTA | 01-10 | Confiabilidade |
| 15 | Critérios de Seleção | MÉDIA | 17-20, 21-27 | Qualidade de deps |
| 16 | Versionamento | ALTA | 21 | Ecossistema modular |
| 17 | Deprecation | MÉDIA | 21 (implícito) | Evolução suave |
| 18 | Modularização | ALTA | 21-27 | Arquitetura |
| 19 | Papéis de Agents | CRÍTICA | 11-16 | Produtividade IA |
| 20 | Protocolo de Handoff | CRÍTICA | 11-16 | Coordenação |
| 21 | Configuração de Ambiente | ALTA | 15-16, 34 | Onboarding |

---

## ✅ PRÓXIMOS PASSOS

### 1. Aprovação
- [ ] Revisar todas as 9 regras propostas
- [ ] Aprovar ou solicitar ajustes
- [ ] Priorizar ordem de implementação

### 2. Implementação
- [ ] Adicionar RULES 13-21 em `00-Config/03-RULES-GLOBAL.md`
- [ ] Criar documentos de suporte referenciados
- [ ] Atualizar documentos existentes que mencionam regras
- [ ] Adicionar exemplos práticos
- [ ] Criar templates reutilizáveis

### 3. Comunicação
- [ ] Anunciar novas regras
- [ ] Treinar agents com novas regras
- [ ] Atualizar guias de onboarding
- [ ] Adicionar a FAQs

### 4. Validação
- [ ] Testar aplicação das regras em projeto piloto
- [ ] Coletar feedback
- [ ] Ajustar conforme necessário
- [ ] Iterar

---

## 📝 CONCLUSÃO

Estas 9 novas regras (13-21) foram identificadas através de análise profunda do dossier de 39 blocos. Cada regra:

✅ **Tem fundamentação clara** no dossier  
✅ **Resolve gaps críticos** identificados  
✅ **É prática e aplicável** imediatamente  
✅ **Tem exemplos concretos** de uso  
✅ **Integra-se** com regras existentes (1-12)  

**Impacto Esperado:**
- ✅ Custos de IA controlados (Rule 13)
- ✅ Integrações confiáveis (Rule 14)
- ✅ Tecnologias bem escolhidas (Rule 15)
- ✅ Ecossistema modular evoluindo (Rules 16-18)
- ✅ Produtividade massiva com agents (Rules 19-21)

**Recomendação Final:**  
✅ **APROVAR E IMPLEMENTAR** todas as 9 regras em ordem de prioridade.

---

**Documento gerado:** 2025-11-16  
**Relacionado a:** ANALYSIS-DOSSIER-PROFUNDA.md, GAPS-E-NOVOS-INSIGHTS.md  
**Destino:** 00-Config/03-RULES-GLOBAL.md  
**Status:** ✅ PRONTO PARA APROVAÇÃO
