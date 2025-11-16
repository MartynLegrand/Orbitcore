# MATRIZ BLOCOS-REGRAS-DOCS

**Data:** 2025-11-16  
**Relacionado a:** ANALYSIS-DOSSIER-PROFUNDA.md  
**Status:** ✅ COMPLETA

---

## 📊 TABELA PRINCIPAL

| Bloco | Título | Explícito | Implícito | Gaps | Rules | Destino | Status |
|-------|--------|-----------|-----------|------|-------|---------|--------|
| 01 | Pricing GPT-5 Pro | US$ 200/mês, acesso "ilimitado", fair use | Otimização de custos, monitoramento | Estratégia custos, limites práticos | 3, 10 | 05-IA-e-Agents/02-GPT-5-Pro-Integration.md | CRIAR |
| 02 | API vs Chat | Duas formas acesso, pay-as-you-go vs subscription | Decisão arquitetural, requisitos produção | Critérios decisão, padrões integração | 2, 6 | 05-IA-e-Agents/02-GPT-5-Pro-Integration.md | CRIAR |
| 03 | Otimização Custos | Reduzir tokens, modelos menores, caching | Arquitetura cost-aware, métricas | Guidelines modelos, thresholds | 10 | 05-IA-e-Agents/09-Otimizacao-de-Custos.md | CRIAR |
| 04 | GitHub Copilot | Copilot NÃO usa GPT-5 Pro, modelos próprios | Diferenças ferramentas, limitações | Comparação capacidades | 6, 10 | 05-IA-e-Agents/10-Comparacao-Ferramentas-IA.md | CRIAR |
| 05 | Link API | Links oficiais OpenAI API | Processo setup, onboarding | Setup completo, testes | 3, 5 | 07-Receitas-e-Playbooks/01-Setup-OpenAI-API.md | CRIAR |
| 06-10 | Config & IDs | Model IDs, API keys, formulários | Gestão credenciais, versionamento | Rotação keys, validação | 3, 5 | 07-Receitas-e-Playbooks/01-Setup-OpenAI-API.md | CRIAR |
| 11 | Agent Acesso Total | Desejo autonomia máxima | Segurança vs autonomia, approval gates | Política permissões, rollback | 3, 5 | 05-IA-e-Agents/01-Arquitetura-de-Agents.md | UPDATE |
| 12-14 | Pro vs Codex | Pro=arquitetura, Codex=código, Executor=médio | Workflow handoff, orquestração | Protocolo handoff, formato .TASK | 12 | 05-IA-e-Agents/11-Protocolo-Handoff.md | CRIAR |
| 15-16 | Config Trae | Configuração agents, permissões | Sistema permissões granular | Setup Trae, troubleshooting | 12 | 02-Guia-para-Devs/06-Setup-Trae-Agents.md | CRIAR |
| 17 | Reallusion OS | Busca repos 3D open-source | Estratégia reuso, avaliação projetos | Critérios avaliação, licensing | 7 | 08-Referencias-Externas/01-3D-Open-Source-Repos.md | CRIAR |
| 18-20 | Catálogo 3D | Lista projetos 3D, rendering, animação | Curadoria, qualidade, contribuição | Processo curadoria, roadmap | 7 | 08-Referencias-Externas/05-Criterios-Selecao-3D.md | CRIAR |
| 21 | Metodologia Modular | LEGO corporativo, contratos, tipos conexão | Design patterns, governance, CI/CD | LANGUAGE, DIFF, deprecation | 1,2,6,7,18 | 02-Guia-para-Devs/01-Metodologia-Modular.md | CRIAR |
| 22 | Glossário Técnico | RBAC, JWT, TLS, módulo, stack, etc. | Necessidade glossário, progressão | Glossário completo, exemplos | 4 | 06-Glossario-Tecnico/ | EXPANDIR |
| 23-24 | Componentes | TESTING, MONITORING, BACKUP, SCALING | DevOps practices, security-first | Testing strategy, monitoring stack | 3, 10 | 02-Guia-para-Devs/04-Testing-Strategy.md | CRIAR |
| 25-26 | Stacks Detalhadas | NestJS, FastAPI, Next.js, PostgreSQL | Patterns por stack, trade-offs | Starter templates, migration guides | 6 | 04-Stacks-e-Infra/ | UPDATE |
| 27 | Consolidação | Reafirmação metodologia completa | Ciclo vida, aprovação, iteração | Processo review, acceptance criteria | Múltiplas | Validação | OK |
| 28-35 | Uploads Contexto | Arquivos de contexto, configs | Sincronização informações | Consolidação, conflitos | 5 | 99-Log-e-Historico/ | ORGANIZAR |
| 36 | Memória Chat | Pergunta sobre memória ChatGPT | Limitações context window | Gestão contexto longo | 5 | N/A | MOTIV |
| 37 | Árvore Docs | Estrutura completa vault proposta | Information architecture, navigation | Arquivos faltantes, links | 4,5,8 | TODO VAULT | PLANTA |
| 38 | Revisão Final | Pedido revisão completa | Quality assurance, completude | Processo review | 10 | N/A | MOTIV |
| 39 | Consolidação | Pedido versão final consolidada | Base para todas próximas tarefas | N/A | Todas | N/A | BASE |

---

## 📈 ESTATÍSTICAS

### Por Grupo
- **Grupo 1 (01-10):** OpenAI API & GPT-5 Pro - 10 blocos
- **Grupo 2 (11-16):** Multi-Agent Architecture - 6 blocos
- **Grupo 3 (17-20):** Open-Source 3D - 4 blocos
- **Grupo 4 (21-27):** Metodologia & Stacks - 7 blocos
- **Grupo 5 (28-39):** Meta-Documentação - 12 blocos

### Por Status
- **CRIAR:** 18 arquivos novos
- **UPDATE:** 15 arquivos existentes
- **EXPANDIR:** Glossário completo
- **ORGANIZAR:** Histórico e logs
- **OK:** Validados

### Por Prioridade de Rules
- **Rules existentes mais citadas:** 3 (Segurança), 5 (Fonte Verdade), 6 (Stack)
- **Rules mais necessárias:** 13-21 (todas faltando)
- **Rules implícitas encontradas:** 18 (Modularização)

---

## 🔄 CROSS-REFERENCES

### Blocos que se relacionam

**GPT-5 & Agents:**
- Blocos 01-10 → Blocos 11-16 (configuração → uso)
- Blocos 11-16 → Bloco 27 (agents → metodologia)

**Metodologia & Stack:**
- Blocos 21-27 → Bloco 37 (metodologia → estrutura)
- Blocos 21-22 → Blocos 25-26 (conceitos → implementação)

**Open-Source & Integração:**
- Blocos 17-20 → Bloco 21 (3D repos → conversão modular)
- Blocos 17-20 → Rule 7, 13 (repos → regras)

**Meta & Consolidação:**
- Blocos 28-39 → TODOS (contexto → aplicação)
- Bloco 37 → Estrutura completa (planta mestra)

---

## 🎯 MAPEAMENTO RULES → BLOCOS

| Rule | Blocos Relacionados | Completo? |
|------|-------------------|-----------|
| 1. Nomenclatura | 21, 27 | ✅ |
| 2. Contratos | 21, 27 | ✅ |
| 3. Segurança | 01-10, 11, 22 | ✅ |
| 4. Linkagem | 22, 37 | ✅ |
| 5. Fonte Verdade | 05-10, 28-39 | ⚠️ Expandir |
| 6. Stack Fixa | 02, 04, 25-27 | ✅ |
| 7. Conversão OS | 17-21 | ✅ |
| 8. Ignore/Index | 37 | ✅ |
| 9. Cache Hygiene | - | ℹ️ N/A blocos |
| 10. Validação | 01-04, 23-24, 38 | ✅ |
| 11. Plugins | - | ℹ️ N/A blocos |
| 12. Tasks | 11-16, 27 | ⚠️ Expandir |
| 13. Custos IA | 01-03 | ❌ CRIAR |
| 14. Integração IA | 01-10 | ❌ CRIAR |
| 15. Seleção Tech | 17-20, 21 | ❌ CRIAR |
| 16. Versionamento | 21 | ❌ CRIAR |
| 17. Deprecation | 21 (implícito) | ❌ CRIAR |
| 18. Modularização | 21-27 | ⚠️ Existia mas não documentada |
| 19. Papéis Agents | 11-16 | ❌ CRIAR |
| 20. Handoff | 11-16 | ❌ CRIAR |
| 21. Config Ambiente | 15-16 | ❌ CRIAR |

---

## 📂 MAPEAMENTO BLOCOS → ARQUIVOS DESTINO

### 05-IA-e-Agents/
- **01-Arquitetura-de-Agents.md** (UPDATE): Blocos 11-16, 21, 27
- **02-GPT-5-Pro-Integration.md** (CRIAR): Blocos 01-10
- **09-Otimizacao-de-Custos.md** (CRIAR): Blocos 01-03
- **10-Comparacao-Ferramentas-IA.md** (CRIAR): Bloco 04
- **11-Protocolo-Handoff.md** (CRIAR): Blocos 11-16

### 02-Guia-para-Devs/
- **01-Metodologia-Modular.md** (CRIAR): Bloco 21
- **02-Criando-Modulos-OBM.md** (CRIAR): Bloco 21
- **03-Contratos-e-APIs.md** (CRIAR): Bloco 21
- **04-Testing-Strategy.md** (CRIAR): Blocos 23-24
- **05-Integracao-APIs-IA.md** (CRIAR): Blocos 01-10
- **06-Setup-Trae-Agents.md** (CRIAR): Blocos 15-16
- **07-Integracao-Codigo-Externo.md** (CRIAR): Blocos 17-20

### 07-Receitas-e-Playbooks/
- **01-Setup-OpenAI-API.md** (CRIAR): Blocos 05-10
- **02-Configurar-Agents-Trae.md** (CRIAR): Blocos 15-16
- **05-Cost-Optimization.md** (CRIAR): Blocos 01-03
- **06-Backup-Recovery.md** (CRIAR): Bloco 24

### 08-Referencias-Externas/
- **01-3D-Open-Source-Repos.md** (CRIAR): Blocos 17-20
- **05-Criterios-Selecao-3D.md** (CRIAR): Blocos 17-20
- **04-Catalogo-OS-3D-LLM-Reuso.md** (UPDATE): Blocos 17-20

### 04-Stacks-e-Infra/
- **01-Stack-Oficial-Martyn.md** (UPDATE): Blocos 25-27
- **02-Backend-TS-Nest.md** (UPDATE): Blocos 25-26
- **03-Backend-Python-FastAPI.md** (UPDATE): Blocos 25-26
- **04-Frontend-React-Next.md** (UPDATE): Blocos 25-26
- **09-Observabilidade.md** (UPDATE): Blocos 23-24

### 06-Glossario-Tecnico/
- **Múltiplos arquivos** (EXPANDIR): Bloco 22 (todos os termos)

### 00-Config/
- **03-RULES-GLOBAL.md** (UPDATE): Blocos 01-27 (adicionar rules 13-21)
- **08-Governance-Documentacao.md** (CRIAR): Blocos 28-39

### 99-Log-e-Historico/
- **ORGANIZAR:** Blocos 28-35

---

## 🔍 ANÁLISE DE COBERTURA POR BLOCO

### Blocos Totalmente Cobertos
- ✅ Bloco 06-10: Configuração documentável
- ✅ Bloco 27: Consolidação (validação)
- ✅ Bloco 37: Estrutura (planta mestra)
- ✅ Bloco 39: Base para ação

### Blocos Com Gaps Críticos
- ⚠️ Blocos 01-03: Custos IA (falta rule 13)
- ⚠️ Blocos 11-16: Handoff (falta rule 19-20)
- ⚠️ Bloco 21: LANGUAGE/DIFF não explicados
- ⚠️ Bloco 22: Glossário incompleto

### Blocos Motivacionais (Não Geraram Docs Diretos)
- ℹ️ Bloco 36: Motivou criar documentação
- ℹ️ Bloco 38: Motivou revisão
- ℹ️ Blocos 28-35: Forneceram contexto

---

## 📊 MATRIZ DE DEPENDENCIES

### Blocos que dependem de outros

**Para entender Agents (11-16):**
- Precisa ler: 01-10 (config GPT-5)
- Precisa ler: 21 (metodologia modular)

**Para entender Metodologia (21-27):**
- Opcional: 11-16 (agents que usarão)
- Opcional: 17-20 (open-source para integrar)

**Para entender Estrutura (37):**
- Precisa ler: TODOS os anteriores (consolida tudo)

---

## ✅ CHECKLIST DE USO DESTA MATRIZ

### Para Architect Agent:
- [ ] Usar para planejar ordem de criação de docs
- [ ] Identificar dependencies entre arquivos
- [ ] Priorizar por status e impacto

### Para Dev Agent:
- [ ] Usar para saber qual bloco mapeia pra qual arquivo
- [ ] Validar que todos os insights foram capturados
- [ ] Cross-reference ao criar documentos

### Para Executor Agent:
- [ ] Usar para validar completude
- [ ] Verificar que nenhum bloco foi esquecido
- [ ] Confirmar status de cada arquivo

---

## 📝 NOTAS FINAIS

Esta matriz serve como **índice invertido** do dossier:
- **Dossier → Docs:** Use esta matriz
- **Docs → Dossier:** Use wikilinks nos docs criados
- **Rule → Dossier:** Veja seção "Mapeamento Rules → Blocos"
- **Arquivo → Dossier:** Veja seção "Mapeamento Blocos → Arquivos"

**Manter atualizada:** Sim, conforme docs são criados/atualizados

---

**Documento gerado:** 2025-11-16  
**Relacionado a:** ANALYSIS-DOSSIER-PROFUNDA.md, GAPS-E-NOVOS-INSIGHTS.md  
**Status:** ✅ COMPLETO
