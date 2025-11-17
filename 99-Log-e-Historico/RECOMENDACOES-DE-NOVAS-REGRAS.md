# RECOMENDAÇÕES DE NOVAS REGRAS (13-22)

> **Documento:** RECOMENDACOES-DE-NOVAS-REGRAS.md  
> **Data:** 2025-11-16  
> **Objetivo:** Propor 10 novas regras (Rules 13-22) baseadas na análise profunda dos 39 blocos do dossier.

---

## RESUMO EXECUTIVO

**Contexto:** Sistema atual tem 12 regras, problem statement menciona 21. Gap de 9 regras.

**Proposta:** Criar Rules 13-22 (10 novas regras) fundamentadas na análise dos 39 blocos.

**Priorização:**
- 🔴 **Críticas (4):** Rules 13, 15, 16, 19 - implementar primeiro
- 🟠 **Altas (4):** Rules 14, 17, 18, 22 - implementar em seguida  
- 🟡 **Médias (2):** Rules 20, 21 - implementar depois

**Impacto:** Formaliza metodologia central, preenche gaps críticos, melhora qualidade.

---

## REGRAS PROPOSTAS

### Rule 13: Open Source Ético e Reaproveitamento 🔴

**Fundamentação:** Blocos 17-20, Gap crítico identificado

**Conteúdo:**
- Preferir licenças permissivas (MIT, Apache, BSD)
- Verificar compatibilidade de licença antes de integrar
- Manter atribuição original quando requerido
- Contribuir melhorias de volta quando possível
- Critérios de avaliação: código, atividade, comunidade, docs, manutenção

**Docs:** `07-Receitas-e-Playbooks/07-Avaliacao-de-Repos-3D.md`

---

### Rule 14: Model Selection e Especialização 🟠

**Fundamentação:** Blocos 6-7, 11-14

**Conteúdo:**
- GPT-5 Pro: arquitetura, planejamento, decisões de alto nível
- GPT-5.1 Codex: implementação de código, debugging
- GPT-5 Executor: QA, linting, acabamento
- Sempre usar model ID correto na API
- Estratégia de fallback se modelo indisponível

**Docs:** `05-IA-e-Agents/10-Model-Selection-Matrix.md`

---

### Rule 15: Metodologia Orbit/OBM - Módulo Primeiro 🔴

**Fundamentação:** Blocos 21, 27, 39

**Conteúdo:**
- Sempre criar módulo reutilizável antes de app específico
- Módulos devem ter: objetivo, contrato, testes, docs, exemplos
- Apps são composições de módulos
- Prefixo `obm-*` obrigatório para módulos
- Nunca duplicar lógica - extrair em módulo

**Docs:** `02-Guia-para-Devs/01-Metodologia-Orbit-OBM.md`

---

### Rule 16: Arquitetura Explícita - Trio de Documentos 🔴

**Fundamentação:** Blocos 21, 27, 34, 39

**Conteúdo:**
- Todo módulo/app deve ter 3 docs antes de implementação:
  - `ARCHITECTURE.md`: decisões de design, componentes
  - `PLAN.md`: tasks, ordem de implementação
  - `ACCEPTANCE.md`: critérios de "pronto"
- Architect gera estes docs antes de Dev começar
- Approval gates entre fases

**Docs:** `07-Receitas-e-Playbooks/08-Workflow-Padrao.md`

---

### Rule 17: E2E Completo - Nada Fake 🟠

**Fundamentação:** Bloco 39, seção 4.1

**Conteúdo:**
- Botão existe → tem ação real (não mockup)
- Sempre entregar: backend + frontend + DB + Docker + docs + exemplos
- Sem TODOs ou FIXMEs em código de produção
- Definition of Done rigoroso
- Testes devem cobrir fluxo completo

**Docs:** `07-Receitas-e-Playbooks/12-E2E-Checklist.md`

---

### Rule 18: Modularização e Contratos Claros 🟠

**Fundamentação:** Blocos 22, 39, Rule 2 expandida

**Conteúdo:**
- Todo módulo define contrato formal:
  - Inputs (tipos, validações)
  - Outputs (formato, códigos de status)
  - Errors (catálogo de erros possíveis)
  - APIs/SDKs (como integrar)
- Versionamento semântico obrigatório
- Preferir REST entre linguagens diferentes

**Docs:** `02-Guia-para-Devs/02-Contratos-e-APIs.md`

---

### Rule 19: Papéis de Agents e Handoff 🔴

**Fundamentação:** Blocos 11-16, CORE da metodologia

**Conteúdo:**
- 3 agentes especializados (não generalistas):
  - Architect (GPT-5 Pro): planejamento
  - Dev (GPT-5.1 Codex): implementação
  - Executor (GPT-5): QA e acabamento
- Pipeline obrigatório: Architect → Dev → Executor
- Handoff via formato .task padronizado
- Approval gates entre fases

**Docs:** 
- `05-IA-e-Agents/01-Arquitetura-de-Agents.md`
- `05-IA-e-Agents/12-Handoff-Protocol.md`

---

### Rule 20: Style Guide de Documentação 🟡

**Fundamentação:** Bloco 26

**Conteúdo:**
- Sempre repetir contexto (ex: "FRONTEND: TypeScript")
- Preferir clareza sobre concisão
- Code blocks sempre com linguagem especificada
- Wikilinks Obsidian para conceitos técnicos
- Exemplos práticos obrigatórios em tutoriais

**Docs:** `00-Config/08-Style-Guide-Documentation.md`

---

### Rule 21: Context Validation e Checkpoints 🟡

**Fundamentação:** Bloco 36

**Conteúdo:**
- Em conversas longas, fazer checkpoints de contexto
- Listar decisões tomadas periodicamente
- Documentar decisões imediatamente
- Usar tags/markers para decisões importantes
- Ao finalizar, fazer revisão completa

**Docs:** `05-IA-e-Agents/14-Context-Management.md`

---

### Rule 22: Quality Gates e Revisão Obrigatória 🟠

**Fundamentação:** Bloco 38

**Conteúdo:**
- Toda entrega passa por QA do Executor
- Checklist de qualidade:
  - Lint passa sem erros
  - Testes passam (coverage > 80%)
  - Build sem warnings
  - Docs atualizadas
  - Sem dead code
  - Sem secrets hardcoded
- Code review obrigatório

**Docs:** `07-Receitas-e-Playbooks/10-Checklist-Revisao-Final.md`

---

## MATRIZ DE FUNDAMENTAÇÃO

| Regra | Blocos | Categoria | Prioridade | Impacto |
|-------|--------|-----------|------------|---------|
| 13 | 17-20 | Técnica + Governança | 🔴 | Alto - bloqueia integração 3D |
| 14 | 6-7, 11-14 | Técnica | 🟠 | Alto - uso correto de IA |
| 15 | 21, 27, 39 | Processo | 🔴 | Crítico - core metodologia |
| 16 | 21, 27, 34 | Processo | 🔴 | Crítico - define workflow |
| 17 | 39 | Qualidade | 🟠 | Alto - padrão de entrega |
| 18 | 22, 39 | Técnica | 🟠 | Alto - qualidade interfaces |
| 19 | 11-16 | Processo | 🔴 | Crítico - core metodologia |
| 20 | 26 | Governança | 🟡 | Médio - consistência docs |
| 21 | 36 | Processo + Qualidade | 🟡 | Médio - previne perda contexto |
| 22 | 38 | Qualidade | 🟠 | Alto - garantia qualidade |

---

## CAMINHO DE IMPLEMENTAÇÃO

### Fase 1: Críticas (Semana 1)
1. Rule 19 (Papéis de Agents) - bloqueia outras
2. Rule 15 (Módulo Primeiro) - fundação
3. Rule 16 (Trio de Documentos) - workflow
4. Rule 13 (Open Source Ético) - decisões 3D

### Fase 2: Altas (Semana 2)
5. Rule 14 (Model Selection) - depende de 19
6. Rule 18 (Contratos Claros) - depende de 15
7. Rule 17 (E2E Completo) - depende de 16
8. Rule 22 (Quality Gates) - depende de 16, 19

### Fase 3: Médias (Semana 3)
9. Rule 20 (Style Guide) - independente
10. Rule 21 (Context Validation) - independente

---

## PROCESSO DE APROVAÇÃO

### Etapas
1. **Revisão:** Architect, Tech Lead, Product Owner (3-5 dias)
2. **Feedback:** Período de comentários
3. **Ajustes:** Incorporar feedback válido
4. **Aprovação:** Votação formal
5. **Implementação:** Adicionar ao RULES-GLOBAL.md
6. **Adoção:** 30 dias para compliance completo

### Aprovadores Necessários
- [ ] Architect (@username)
- [ ] Tech Lead (@username)  
- [ ] Product Owner (@username)

---

## IMPACTO ESTIMADO

**Esforço de Implementação:**
- Formalização das rules: 2-3h
- Documentação suporte: 10-15h
- Total: 12-18h

**Benefícios:**
- ✅ Metodologia completamente formalizada
- ✅ Gaps críticos preenchidos
- ✅ Qualidade garantida por processo
- ✅ Onboarding facilitado
- ✅ Framework completo para escalar

**Riscos se NÃO implementar:**
- ❌ Inconsistência nas entregas
- ❌ Decisões ad-hoc sem critério
- ❌ Perda de contexto em projetos longos
- ❌ Qualidade variável
- ❌ Dificuldade de escalar

---

## CONCLUSÃO

As 10 regras propostas (13-22) são **fundamentadas solidamente** nos 39 blocos analisados e preenchem **gaps críticos** identificados.

**Recomendação:** Aprovar e implementar em 3 fases (Críticas → Altas → Médias).

**Próximo Passo:** Revisão formal por stakeholders.

---

*Documento gerado em: 2025-11-16*  
*Autor: GPT-5 Analyzer (CONTEXTO ACUMULADOR)*  
*Versão: 1.0 - PROPOSTA EXECUTIVA*
