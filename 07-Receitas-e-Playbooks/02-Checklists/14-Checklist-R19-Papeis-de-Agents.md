# Checklist: R19 - Papéis de Agents (3 Arquétipos)

**Regra:** 3 agentes claros - 🟦 Architect (planejar), 🟧 Codex Dev (implementar), 🟩 Executor (corrigir). Nunca misturar papéis.

**Versão:** 1.0  
**Última atualização:** 2025-11-16

---

## 📋 Checklist Completo

### 1. Identificação de Agentes

#### 1.1 🟦 Architect (GPT-5 Pro)

**Responsabilidades PERMITIDAS (✅):**
- [ ] Planejar arquitetura de solução
- [ ] Especificar requisitos técnicos
- [ ] Criar diagramas e documentação
- [ ] Validar qualidade de implementação
- [ ] Revisar código (code review)
- [ ] Tomar decisões estratégicas
- [ ] Definir padrões e convenções
- [ ] Identificar riscos técnicos

**Responsabilidades PROIBIDAS (❌):**
- [ ] Escrever código de produção longo (> 50 linhas)
- [ ] Implementar features completas
- [ ] Fazer refatorações extensas
- [ ] Criar testes (apenas especificar)
- [ ] Deploy de código

**Quando Chamar:**
- Nova feature complexa (> 8h esforço)
- Decisão arquitetural necessária
- Definição de padrões novos
- Code review de PRs grandes
- Planejamento de sprints/releases

---

#### 1.2 🟧 Codex Dev (GPT-5.1)

**Responsabilidades PERMITIDAS (✅):**
- [ ] Implementar código conforme especificação
- [ ] Criar testes unitários e integração
- [ ] Seguir padrões definidos pelo Architect
- [ ] Fazer refatorações localizadas
- [ ] Documentar código inline
- [ ] Corrigir bugs simples
- [ ] Criar componentes isolados

**Responsabilidades PROIBIDAS (❌):**
- [ ] Tomar decisões arquiteturais
- [ ] Mudar padrões estabelecidos
- [ ] Pular fases do protocolo .TASK
- [ ] Implementar sem especificação
- [ ] Alterar APIs públicas sem aprovação
- [ ] Fazer deploy autônomo

**Quando Chamar:**
- Implementar feature já planejada
- Criar novos componentes/módulos
- Escrever testes
- Refatoração com escopo definido
- Documentação técnica detalhada

---

#### 1.3 🟩 Executor (GPT-5)

**Responsabilidades PERMITIDAS (✅):**
- [ ] Correções rápidas (< 50 linhas)
- [ ] Ajustes de configuração
- [ ] Patches de segurança
- [ ] Otimizações pontuais
- [ ] Fixes de bugs urgentes
- [ ] Atualização de dependências
- [ ] Manutenção de código legado

**Responsabilidades PROIBIDAS (❌):**
- [ ] Criar features novas
- [ ] Fazer mudanças arquiteturais
- [ ] Alterar contratos de API
- [ ] Refatorar múltiplos arquivos
- [ ] Tomar decisões estratégicas

**Quando Chamar:**
- Bug crítico em produção
- Hotfix urgente
- Ajuste de configuração rápido
- Otimização pontual
- Correção de typo/formatting

---

### 2. Matriz de Decisão

#### 2.1 Qual Agente para Qual Tarefa?

| Tarefa | Architect | Codex Dev | Executor |
|--------|-----------|-----------|----------|
| Planejar nova feature | ✅ | ❌ | ❌ |
| Implementar feature planejada | ❌ | ✅ | ❌ |
| Corrigir bug urgente | ❌ | ❌ | ✅ |
| Criar diagrama de arquitetura | ✅ | ❌ | ❌ |
| Escrever testes | ❌ | ✅ | ❌ |
| Code review | ✅ | ❌ | ❌ |
| Ajustar config | ❌ | ❌ | ✅ |
| Definir padrões | ✅ | ❌ | ❌ |
| Refatorar módulo completo | ✅ plano | ✅ impl | ❌ |
| Patch de segurança | ❌ | ❌ | ✅ |
| Criar novo módulo | ✅ plano | ✅ impl | ❌ |
| Otimizar query SQL | ❌ | ❌ | ✅ |
| Migração de dados | ✅ plano | ✅ impl | ❌ |
| Atualizar README | ❌ | ✅ | ✅ |
| Deploy | ❌ | ❌ | ✅ |

---

### 3. Workflow de Handoff

#### 3.1 Architect → Codex Dev

**Template de Handoff:**

```markdown
# Handoff: [Feature Name]

**De:** Architect
**Para:** Codex Dev
**Data:** 2025-11-16

## Contexto
[Descrição do problema e solução planejada]

## Especificação Completa
- [ ] Diagrama de arquitetura anexado
- [ ] Estrutura de arquivos definida
- [ ] Contratos de API especificados
- [ ] Testes a serem criados listados
- [ ] Padrões de código definidos

## Decisões Técnicas
| Decisão | Escolha | Justificativa |
|---------|---------|---------------|
| Framework | NestJS | Padrão do projeto |
| Validação | class-validator | Já usado |

## Checklist de Implementação
1. [ ] Criar DTO com validações
2. [ ] Implementar service
3. [ ] Criar controller
4. [ ] Escrever testes (≥80% coverage)
5. [ ] Documentar API

## Critérios de Aceitação
- [ ] Todos os testes passam
- [ ] Coverage ≥ 80%
- [ ] Lint sem erros
- [ ] Build passa

## Bloqueadores Conhecidos
Nenhum

## Prazo Estimado
4-6 horas

**Aprovação:** ✅ Pode implementar
```

**Checklist de Handoff:**
- [ ] Especificação completa e clara?
- [ ] Não há ambiguidades?
- [ ] Todas as decisões documentadas?
- [ ] Checklist de implementação presente?
- [ ] Critérios de aceitação definidos?
- [ ] Prazo estimado realista?

---

#### 3.2 Codex Dev → Architect (Review)

**Template de Review Request:**

```markdown
# Review Request: [Feature Name]

**De:** Codex Dev
**Para:** Architect
**Data:** 2025-11-16

## Implementação Completa
- [x] Pull Request: #123
- [x] Branch: feature/email-validation
- [x] Commits: 4 (atomic)

## Checklist de Implementação
- [x] Todos os itens do plano concluídos
- [x] Testes criados (coverage: 92%)
- [x] Lint passa
- [x] Build passa
- [x] Documentação atualizada

## Desvios do Plano
Nenhum. Implementação seguiu especificação exata.

## Dificuldades Encontradas
Nenhuma

## Próximos Passos
Aguardando review e merge.
```

**Checklist de Review Request:**
- [ ] Todos os itens do plano concluídos?
- [ ] Testes passam?
- [ ] Coverage ≥ 80%?
- [ ] Desvios documentados e justificados?
- [ ] PR com descrição completa?

---

#### 3.3 Codex Dev/Architect → Executor (Hotfix)

**Template de Handoff para Hotfix:**

```markdown
# Hotfix Request: [Bug Description]

**De:** Architect/Codex Dev
**Para:** Executor
**Prioridade:** URGENTE
**Data:** 2025-11-16

## Problema
[Descrição clara do bug em produção]

## Impacto
- **Usuários Afetados:** 10,000
- **Severidade:** Crítica
- **Downtime:** Sim

## Solução Proposta
[Descrição da correção mínima necessária]

## Arquivos Afetados
- `src/modules/user/user.service.ts` (linha 45)

## Mudança Exata
```diff
- if (user.email) {
+ if (user.email && user.email.includes('@')) {
```

## Validação
- [ ] Testar localmente
- [ ] Verificar que não quebra outros casos
- [ ] Deploy em staging primeiro
- [ ] Smoke test

## Rollback Plan
```bash
git revert <commit-hash>
kubectl rollout undo deployment/user-service
```

**Aprovação:** ✅ Pode executar
```

**Checklist de Handoff Hotfix:**
- [ ] Problema claro e urgente?
- [ ] Solução mínima (< 50 linhas)?
- [ ] Impacto documentado?
- [ ] Plano de rollback presente?
- [ ] Validação definida?

---

### 4. Evitar Mistura de Papéis

#### 4.1 ❌ Anti-Pattern: Architect Implementando

**Cenário (ERRADO):**
```markdown
Architect:
"Vou planejar a feature E também vou implementar porque é simples"

[3 horas depois]

Architect:
[Escreveu 500 linhas de código]
[Não validou qualidade]
[Não fez code review de si mesmo]
[Não seguiu protocolo .TASK]
```

**Problema:**
- Architect perdeu visão estratégica
- Código não foi revisado adequadamente
- Protocolo foi quebrado
- Qualidade comprometida

**Correto:**
```markdown
Architect:
1. Planejar feature (2h)
2. Criar especificação detalhada
3. Handoff para Codex Dev
4. Codex Dev implementa (3h)
5. Architect revisa código
```

---

#### 4.2 ❌ Anti-Pattern: Codex Dev Decidindo Arquitetura

**Cenário (ERRADO):**
```markdown
Codex Dev (durante implementação):
"Hmm, acho que seria melhor usar MongoDB aqui ao invés de PostgreSQL como o Architect especificou. Vou mudar."

[Implementa com MongoDB]
[Muda toda a arquitetura]
```

**Problema:**
- Decisão arquitetural sem aprovação
- Inconsistência com o resto do sistema
- Pode ter impactos não previstos

**Correto:**
```markdown
Codex Dev:
"Identifiquei que MongoDB poderia ser melhor aqui.

**PAUSAR implementação**

Handoff para Architect:
- Problema identificado: PostgreSQL pode não ser ideal
- Proposta: Usar MongoDB
- Prós/Contras: [lista]
- Pedir aprovação

[Aguardar decisão do Architect]
```

---

#### 4.3 ❌ Anti-Pattern: Executor Criando Features

**Cenário (ERRADO):**
```markdown
Executor (durante hotfix):
"Enquanto corrijo esse bug, vou aproveitar e adicionar validação de email completa porque faz sentido"

[Adiciona feature nova]
[Aumenta escopo]
[Não testa adequadamente]
```

**Problema:**
- Escopo cresceu (scope creep)
- Feature não planejada
- Pode introduzir novos bugs
- Não seguiu protocolo

**Correto:**
```markdown
Executor:
1. Corrigir APENAS o bug crítico (< 50 linhas)
2. Deploy do hotfix
3. Criar issue separada: "Adicionar validação de email"
4. Atribuir para Architect (planejamento)
5. Architect → Codex Dev (implementação)
```

---

### 5. Checklist de Compliance

#### 5.1 Para Architect

**Antes de Iniciar Tarefa:**
- [ ] A tarefa requer planejamento/decisão estratégica?
- [ ] Há múltiplas abordagens a considerar?
- [ ] Impacto arquitetural significativo?
- [ ] Decisões afetam múltiplos módulos?

**Durante Planejamento:**
- [ ] Criei diagramas necessários?
- [ ] Documentei todas as decisões?
- [ ] Especificação está completa?
- [ ] Critérios de aceitação definidos?
- [ ] NÃO estou escrevendo código de implementação?

**Ao Fazer Handoff:**
- [ ] Especificação não tem ambiguidades?
- [ ] Codex Dev tem tudo para implementar?
- [ ] Prazo estimado é realista?

---

#### 5.2 Para Codex Dev

**Antes de Iniciar Implementação:**
- [ ] Recebi especificação completa do Architect?
- [ ] Não há ambiguidades na especificação?
- [ ] Entendo todos os requisitos?
- [ ] Sei quais testes criar?

**Durante Implementação:**
- [ ] Estou seguindo a especificação exata?
- [ ] NÃO estou tomando decisões arquiteturais?
- [ ] NÃO estou pulando etapas do protocolo?
- [ ] Estou criando testes adequados?

**Ao Solicitar Review:**
- [ ] Implementação está completa conforme plano?
- [ ] Todos os testes passam?
- [ ] Desvios foram documentados e justificados?

---

#### 5.3 Para Executor

**Antes de Fazer Hotfix:**
- [ ] Problema é realmente urgente/crítico?
- [ ] Solução é mínima (< 50 linhas)?
- [ ] Não estou criando features novas?
- [ ] Tenho plano de rollback?

**Durante Hotfix:**
- [ ] Mudança é cirúrgica?
- [ ] NÃO estou refatorando além do necessário?
- [ ] Testei localmente?

**Após Hotfix:**
- [ ] Criei issues para melhorias identificadas?
- [ ] Documentei o que foi feito?
- [ ] Notifiquei stakeholders?

---

### 6. Escalação e Comunicação

#### 6.1 Quando Escalar

**Codex Dev → Architect:**
- Ambiguidade na especificação
- Necessidade de decisão técnica
- Bloqueador inesperado
- Mudança de escopo necessária

**Executor → Architect/Codex Dev:**
- Hotfix requer mudanças > 50 linhas
- Problema estrutural identificado
- Necessidade de refatoração maior

**Architect → Stakeholder:**
- Decisão de negócio necessária
- Trade-off precisa ser escolhido
- Prazo/escopo precisa ajuste

---

### 7. Score de Compliance

#### Cálculo do Score

**Pontuação:**
- Agente correto para tarefa (30 pontos)
- Papéis não misturados (25 pontos)
- Handoffs adequados (20 pontos)
- Comunicação clara (15 pontos)
- Escalação quando necessária (10 pontos)

**Total:** 100 pontos

#### Checklist Rápido

| Item | Pontos | ✅ |
|------|--------|---|
| Tarefa atribuída ao agente correto | 30 | ☐ |
| Agente não fez tarefas de outro papel | 25 | ☐ |
| Handoffs usaram templates | 20 | ☐ |
| Comunicação clara e documentada | 15 | ☐ |
| Escalou quando necessário | 10 | ☐ |
| **TOTAL** | **100** | |

### Níveis
- 🏆 **Excellent:** 95-100 pontos
- ✅ **Good:** 85-94 pontos
- ⚠️ **Acceptable:** 75-84 pontos
- ❌ **Insufficient:** < 75 pontos

---

## 📚 Referências

- [[03-RULES-GLOBAL#R19]]
- [[05-IA-e-Agents/01-Arquitetura-de-Agents]]
- [[04-Template-Handoff]]
- [[04-Protocolo-Tasks]]
