# README - FASE 1 EXPANDIDA ✨

> **Versão:** 2.0
> **Data:** 2025-11-16
> **Status:** ✅ PLANEJAMENTO COMPLETO

## 🎯 O Que Foi Entregue

A **FASE 1 EXPANDIDA** estabelece a fundação arquitetural completa do ecossistema OBM com:

### ✅ 9 Novas Regras Críticas (13-21)
- Reaproveitamento Open-Source Ético
- IA: Não Reescreve Tudo
- Protocolo .TASK (3 Fases)
- Regra de Ouro Martyn
- Alterações UI/Layout Only
- Modularização (Modelo Martyn)
- Papéis de Agents (3 Arquétipos)
- Evitar Ambiguidade
- Raciocínio Profundo

### 📚 Documentação Completa (~104KB)
- Extensão de RULES-GLOBAL.md
- Protocolo de Tasks (3 fases)
- Modelo de Modularização completo
- Arquitetura consolidada
- Plano de 31 tasks detalhadas

---

## 📁 Estrutura de Arquivos

### Documentos Principais

#### 1. `03-RULES-GLOBAL.md` (Atualizado)
**O quê:** 21 regras globais completas (12 originais + 9 novas)
**Para quem:** Todos os desenvolvedores e agents
**Quando usar:** Sempre que iniciar nova task ou módulo

**Destaques:**
- Cada regra com descrição completa
- Exemplos ✔️ permitido / ❌ proibido
- Checklists de validação
- Links para docs detalhadas

**Link:** [[00-Config/03-RULES-GLOBAL]]

---

#### 2. `04-Protocolo-Tasks.md` (Novo - 14.5KB)
**O quê:** Protocolo obrigatório de 3 fases para todas as tasks
**Para quem:** Architect, Codex Dev, Executor
**Quando usar:** Em TODAS as tasks de desenvolvimento

**Fases:**
1. **ANÁLISE** - Entender problema (15-30% do tempo)
2. **PLANO** - Projetar solução (20-30% do tempo)
3. **EXECUÇÃO** - Implementar (40-60% do tempo)

**Inclui:**
- Templates para cada fase
- Fluxogramas (Mermaid)
- Exemplos práticos
- Checklist de validação
- Handoffs entre agents

**Link:** [[00-Config/04-Protocolo-Tasks]]

---

#### 3. `05-Modelo-Modularizacao.md` (Novo - 23KB)
**O quê:** Modelo Martyn completo para criação de módulos OBM
**Para quem:** Architect (design) e Codex Dev (implementação)
**Quando usar:** Ao criar novo módulo ou validar existente

**Conteúdo:**
- Definição de módulo OBM
- 8 tipos padronizados (Auth, Billing, Chat, etc.)
- Checklist de 20+ itens obrigatórios
- Estrutura de arquivos completa
- Exemplos de código por tipo de módulo
- Padrões de integração (REST, SDK)

**Exemplos Incluídos:**
```
modules/obm-[name]/
  service/          # Backend (NestJS/FastAPI)
  sdk-js/           # SDK TypeScript
  sdk-py/           # SDK Python
  docs/             # Documentação completa
```

**Link:** [[00-Config/05-Modelo-Modularizacao]]

---

#### 4. `ARCHITECTURE-CONSOLIDACAO-EXPANDIDA.md` (Novo - 26KB)
**O quê:** Visão consolidada da arquitetura com as 21 regras
**Para quem:** Architect, Tech Leads, Stakeholders
**Quando usar:** Decisões arquiteturais, planejamento estratégico

**Conteúdo:**
- Tabela de 21 regras com categorias
- Diagrama de dependências (Mermaid)
- Matriz de interação entre regras
- Impacto detalhado de cada nova regra
- Ordem de cascata (Tier 0-4)
- Compliance por stack (NestJS, FastAPI, Next.js, Docker)
- Gaps e ações necessárias
- Roadmap de implementação

**Seções Chave:**
1. Visão Geral das 21 Regras
2. Estratégia de Incorporação
3. Diagrama de Relacionamento
4. Impacto de Cada Regra
5. Ordem de Cascata
6. Compliance por Stack
7. Gaps e Ações
8. Plano de Implementação

**Link:** [[00-Config/ARCHITECTURE-CONSOLIDACAO-EXPANDIDA]]

---

#### 5. `PLAN-TAREFAS-EXPANDIDO.md` (Novo - 28KB)
**O quê:** Plano detalhado de 31 tasks em 3 tiers
**Para quem:** Project Manager, Architect, Todo o time
**Quando usar:** Planejamento de sprints e tracking de progresso

**Estrutura:**
- **TIER 0:** 11 tasks (Fundação - Semana 1-2)
- **TIER 1:** 8 tasks (Consolidação - Semana 3-4)
- **TIER 2:** 12 tasks (Expansão - Semana 5-8)

**Para cada task:**
- Status (✅ Concluído / 📝 TODO)
- Esforço estimado (horas)
- Responsável (Architect/Codex/Executor)
- Descrição detalhada
- Entregáveis listados
- Critérios de aceitação
- Dependências

**Estimativas:**
- Total: 220-300 horas
- Timeline: 6-8 semanas (40h/semana)

**Link:** [[PLAN-TAREFAS-EXPANDIDO]]

---

#### 6. `05-IA-e-Agents/01-Arquitetura-de-Agents.md` (Atualizado)
**O quê:** Papéis e responsabilidades dos 3 agents
**Para quem:** Todos os agents e desenvolvedores
**Quando usar:** Antes de iniciar qualquer task

**Agents:**
- 🟦 **Architect** (GPT-5 Pro) - Planejar e especificar
- 🟧 **Codex Dev** (GPT-5.1) - Implementar
- 🟩 **Executor** (GPT-5) - Corrigir e otimizar

**Inclui:**
- Matriz de decisão (quem faz o quê)
- Templates de handoff
- Fluxo de trabalho completo
- Exemplos de comunicação

**Link:** [[05-IA-e-Agents/01-Arquitetura-de-Agents]]

---

## 🚀 Como Usar Esta Documentação

### Para Desenvolvedores:

#### Começando Nova Task:
1. Leia [[00-Config/03-RULES-GLOBAL]] - familiarize com 21 regras
2. Siga [[00-Config/04-Protocolo-Tasks]] - aplique 3 fases
3. Se criar módulo: use [[00-Config/05-Modelo-Modularizacao]]

#### Durante Desenvolvimento:
1. Valide compliance com checklists em RULES-GLOBAL
2. Documente decisões em cada fase do protocolo
3. Use templates de handoff para comunicação

#### Antes de PR:
1. Checklist de 21 regras
2. Validar estrutura se for módulo
3. Testes > 80% coverage
4. Documentação atualizada

---

### Para Architect:

#### Planejamento:
1. Consulte [[00-Config/ARCHITECTURE-CONSOLIDACAO-EXPANDIDA]]
2. Identifique regras aplicáveis à task
3. Use protocolo .TASK para estruturar trabalho

#### Design:
1. Siga [[00-Config/05-Modelo-Modularizacao]] para módulos
2. Crie ARCHITECTURE.md e PLAN.md
3. Valide contra 21 regras

#### Handoff:
1. Use templates em [[05-IA-e-Agents/01-Arquitetura-de-Agents]]
2. Garanta que Codex Dev tem tudo que precisa
3. Defina critérios de aceitação claros

---

### Para Codex Dev:

#### Recebendo Task:
1. Leia ARCHITECTURE.md e PLAN.md do Architect
2. Valide entendimento com perguntas
3. Siga protocolo .TASK Fase 3 (Execução)

#### Implementando:
1. Use [[00-Config/05-Modelo-Modularizacao]] se for módulo
2. Commits atômicos e descritivos
3. Testes incrementais

#### Entregando:
1. Checklist de compliance
2. Testes passando (> 80%)
3. Documentação atualizada
4. Request review do Architect

---

### Para Executor:

#### Recebendo Bug/Fix:
1. Valide que é escopo de Executor (< 50 linhas)
2. Se maior, escale para Codex Dev
3. Se arquitetural, escale para Architect

#### Corrigindo:
1. Alterações mínimas (Regra 14)
2. Validar contra regras relevantes
3. Testar antes e depois

#### Documentando:
1. Commit descritivo
2. Atualizar docs se necessário
3. Reportar problema resolvido

---

## 📊 Progresso Atual

### ✅ Concluído (TIER 0 Parcial):
- [x] Task 0.1: Rules 13-21 em RULES-GLOBAL.md
- [x] Task 0.2: Protocolo-Tasks.md
- [x] Task 0.3: Modelo-Modularizacao.md
- [x] Task 0.4: Atualizar IA-e-Agents
- [x] Task 0.5: ARCHITECTURE-CONSOLIDACAO-EXPANDIDA.md

### 📝 Próximos Passos (TIER 0 Restante):
- [ ] Task 0.6: Templates de Protocolo .TASK
- [ ] Task 0.7: Checklists de Validação (21 regras)
- [ ] Task 0.8: Exemplos Práticos (21 regras)
- [ ] Task 0.9: Validação Interna (Dogfooding)
- [ ] Task 0.10: Auditoria de 3 Módulos
- [ ] Task 0.11: Setup CI/CD Básico

**Ver plano completo:** [[PLAN-TAREFAS-EXPANDIDO]]

---

## 🎓 Conceitos Chave

### Protocolo .TASK (3 Fases)
**Por quê?** Evitar retrabalho e garantir qualidade.
**Como?** 
1. ANÁLISE: Entender completamente
2. PLANO: Projetar com alternativas
3. EXECUÇÃO: Implementar incrementalmente

**Nunca pule fases!**

---

### Modelo Martyn de Modularização
**Por quê?** Módulos consistentes e reutilizáveis.
**Como?**
- Um módulo = uma responsabilidade
- Estrutura padrão (service + SDKs + docs)
- Checklist de 20+ itens
- 8 tipos padronizados

**Sempre valide compliance!**

---

### 3 Arquétipos de Agents
**Por quê?** Separação clara de responsabilidades.
**Como?**
- 🟦 Architect: Planejar (NUNCA código longo)
- 🟧 Codex Dev: Implementar (NUNCA decisões próprias)
- 🟩 Executor: Corrigir (NUNCA refactors grandes)

**Siga a matriz de decisão!**

---

### Regra de Ouro Martyn
**Princípio:** "Se ambíguo, PERGUNTE!"
**Proibido:**
- Assumir intenção
- Inferir requisitos
- Inventar comportamentos
- Decidir sem confirmar

**Sempre prefira perguntar!**

---

## 🔗 Links Rápidos

### Documentação Core:
- [[00-Config/03-RULES-GLOBAL]] - 21 regras completas
- [[00-Config/04-Protocolo-Tasks]] - 3 fases obrigatórias
- [[00-Config/05-Modelo-Modularizacao]] - Modelo de módulos
- [[00-Config/ARCHITECTURE-CONSOLIDACAO-EXPANDIDA]] - Arquitetura consolidada
- [[05-IA-e-Agents/01-Arquitetura-de-Agents]] - Papéis de agents

### Planejamento:
- [[PLAN-TAREFAS-EXPANDIDO]] - 31 tasks detalhadas
- [[01-Visao-Geral/04-Arquitetura-de-Repositorio]] - Estrutura de repo

### Desenvolvimento:
- [[02-Guia-para-Devs/04-Fluxo-de-Dev-do-Inicio-ao-Fim]] - Workflow
- [[04-Stacks-e-Infra/01-Stack-Oficial-Martyn]] - Stack técnica
- [[07-Receitas-e-Playbooks/06-Checklist-Validacao-Modulo]] - Checklist

---

## 📈 Métricas de Sucesso

### Documentação:
- ✅ 21 regras documentadas
- ✅ 104KB de documentação nova
- ✅ 15+ diagramas Mermaid
- ✅ 50+ exemplos práticos

### Processo:
- 🎯 Protocolo .TASK em 100% das tasks
- 🎯 Compliance 100% em novos módulos
- 🎯 Coverage > 80% em testes
- 🎯 0 licenças incompatíveis

### Qualidade:
- 🎯 Alterações mínimas (< 200 linhas típico)
- 🎯 Ambiguidades resolvidas antes de codar
- 🎯 Handoffs com templates
- 🎯 Raciocínio profundo sempre aplicado

---

## ⚠️ Avisos Importantes

### NÃO Faça:
- ❌ Pular fases do protocolo .TASK
- ❌ Criar módulo sem seguir modelo Martyn
- ❌ Assumir requisitos sem perguntar
- ❌ Reescrever código funcional desnecessariamente
- ❌ Misturar responsabilidades de agents

### SEMPRE Faça:
- ✅ Leia documentação antes de começar
- ✅ Valide compliance com 21 regras
- ✅ Documente decisões importantes
- ✅ Teste incrementalmente
- ✅ Peça clarificação quando ambíguo

---

## 🆘 Precisa de Ajuda?

### Dúvida sobre Regras:
→ Consulte [[00-Config/03-RULES-GLOBAL]]

### Dúvida sobre Protocolo:
→ Consulte [[00-Config/04-Protocolo-Tasks]]

### Dúvida sobre Módulos:
→ Consulte [[00-Config/05-Modelo-Modularizacao]]

### Dúvida sobre Agents:
→ Consulte [[05-IA-e-Agents/01-Arquitetura-de-Agents]]

### Dúvida sobre Plano:
→ Consulte [[PLAN-TAREFAS-EXPANDIDO]]

### Dúvida Geral:
→ Consulte [[00-Config/ARCHITECTURE-CONSOLIDACAO-EXPANDIDA]]

---

## 🎉 Conclusão

A **FASE 1 EXPANDIDA** estabelece uma fundação sólida para o ecossistema OBM com:

✅ **21 regras globais** completas e documentadas
✅ **Protocolo .TASK** de 3 fases obrigatórias
✅ **Modelo Martyn** para modularização consistente
✅ **3 arquétipos de agents** com papéis claros
✅ **Plano de 31 tasks** para implementação completa

**Próximo passo:** Executar TIER 0 restante (tasks 0.6-0.11) nas próximas 1-2 semanas.

---

> [!tip] Lembre-se
> Esta documentação é **fonte da verdade**. Sempre consulte antes de tomar decisões arquiteturais ou iniciar novas tasks.

**Versão:** 2.0
**Data:** 2025-11-16
**Status:** ✅ PLANEJAMENTO COMPLETO

---

**Autores:**
- Architect GPT-5 Pro
- MartynLegrand (Validação e Aprovação)

**Última Atualização:** 2025-11-16
