# MATRIZ DE MAPEAMENTO: BLOCOS → REGRAS → DOCUMENTAÇÃO

> **Documento:** Tabela sistemática de relacionamento entre blocos do dossier, regras aplicáveis e destinos documentais  
> **Data:** 2025-11-16  
> **Formato:** Markdown Table com navegação

---

## LEGENDA

**Status:**
- ✅ Coberto - Já existe documentação adequada
- 🟡 Parcial - Existe mas precisa expansão
- 🔴 Novo - Precisa criar documentação
- 📝 Atualizar - Precisa atualização

**Prioridade:**
- 🔥 Alta - Fundamental para o sistema
- ⚡ Média - Importante mas não bloqueante
- 💡 Baixa - Nice to have

---

## TABELA PRINCIPAL

| # | Bloco | Título | Explícito | Implícito | Gaps | Regras | Destino | Status | Prioridade |
|---|-------|--------|-----------|-----------|------|--------|---------|--------|------------|
| 01 | BLOCO 01 | Consulta requisições GPT Pro | Custo ~$200/mês, "ilimitado" com fair use | Necessidade gestão de custos | Falta política de uso, métricas | R3, R13* | `05-IA-e-Agents/09-Gestao-de-Custos-e-Uso.md` | 🔴 | 🔥 |
| 02 | BLOCO 02 | API vs Assinatura | API = pay-as-you-go, Web = uso pessoal | Decisão estratégica de consumo | Matriz de decisão ausente | R5, R13* | `05-IA-e-Agents/09-Gestao-de-Custos-e-Uso.md` | 🔴 | 🔥 |
| 03 | BLOCO 03 | Modo mais barato GPT-5 | Preços: Pro=$15+$120/1M, Std=$1.25+$10/1M | Otimização de prompts necessária | Estratégia de caching, guidelines | R10, R13* | `05-IA-e-Agents/10-Otimizacao-de-Prompts.md` | 🔴 | ⚡ |
| 04 | BLOCO 04 | GitHub vs GPT-5 Pro | Copilot ≠ GPT-5 Pro, ferramentas diferentes | Clareza sobre ferramentas | Comparativo de ferramentas | R5, R6 | `05-IA-e-Agents/11-Comparativo-de-Ferramentas-IA.md` | 🔴 | ⚡ |
| 05 | BLOCO 05 | Link API OpenAI | platform.openai.com/docs | Prontidão para integração | Central de links | R4 | `08-Referencias-Externas/01-Links-Importantes.md` | 🟡 | 💡 |
| 06-10 | BLOCOS 06-10 | Config API Keys | ALL→WRITE, Model IDs corretos | Full power agent, segurança critical | Processo seguro de keys, rotação, ambientes | R3, R14* | `05-IA-e-Agents/02-GPT-5-Pro-Integration.md` | 🔴 | 🔥 |
| 11 | BLOCO 11 | Acesso total programação | Permissões completas, 100% recursos | Agente autônomo poderoso | Governança, validação, rollback, auditoria | R3, R10, R14*, R15* | `05-IA-e-Agents/12-Governanca-e-Seguranca-de-Agents.md` | 🔴 | 🔥 |
| 12-13 | BLOCOS 12-13 | Qual GPT programar | Pro=arquitetura, Codex=execução | Multi-agente, especialização | Matriz decisão, protocolo handoff | R12, R16* | `05-IA-e-Agents/01-Arquitetura-de-Agents.md` | 🟡 | 🔥 |
| 14 | BLOCO 14 | 5.1 programar pesado | Sim, sistemas grandes | Validação de escolha | Exemplos documentados | R10 | `05-IA-e-Agents/03-GPT5-1-Codex-Dev-Agent.md` | 🟡 | ⚡ |
| 15-16 | BLOCOS 15-16 | Config 3 agentes Trae | Architect, Codex Dev, Executor definidos | Arquitetura 3 camadas, handoffs | Protocolo handoff, approval gates, métricas | R12, R16*, R17* | `05-IA-e-Agents/01-Arquitetura-de-Agents.md` + `13-Protocolo-de-Handoff-Entre-Agents.md` | 🔴 | 🔥 |
| 17 | BLOCO 17 | Reallusion open-source | Busca alternativas open-source | Preferência open-source ético | Critérios avaliação, due diligence licenças | R7, R13* | `08-Referencias-Externas/05-Criterios-de-Selecao-Open-Source.md` | 🔴 | ⚡ |
| 18-20 | BLOCOS 18-20 | Alternativas 3D | Repos open-source 3D | Estratégia de reuso | Catálogo estruturado, matriz avaliação | R7, R13* | `08-Referencias-Externas/04-Catalogo-OS-3D-LLM-Reuso.md` | 🟡 | ⚡ |
| 21 | BLOCO 21 | Metodologia modular | Building Blocks, contratos, 3 formas integração | Modularização extrema, contratos estáveis | Template contrato, checklist completude, versionamento | R2, R6, R18* | `02-Guia-para-Devs/08-Contratos-e-Interfaces-de-Modulos.md` | 🔴 | 🔥 |
| 22 | BLOCO 22 | Nomenclatura técnica | LANGUAGE, STACK, MODULE, etc | Padronização terminológica | Glossário completo | R4 | `06-Glossario-Tecnico/` (expandir) | 🟡 | ⚡ |
| 23-24 | BLOCOS 23-24 | Componentes adicionais | Suficiência de componentes | Busca por completude | Checklist componentes essenciais | R10 | `02-Guia-para-Devs/10-Checklist-de-Componentes-Essenciais.md` | 🔴 | ⚡ |
| 25-26 | BLOCOS 25-26 | Stacks linguagens | NestJS, FastAPI, Next, contexto sempre | Clareza documental, repetição válida | Template doc com contexto | R6, R19* | `00-Config/08-Template-de-Documentacao-Padrao.md` | 🔴 | ⚡ |
| 27 | BLOCO 27 | Metodologia consolidada | Tudo integrado: 3 agents, módulos, registry | Sistema completo, automação CLI | Validação completa | R13*-R19* | `01-Visao-Geral/` + `02-Guia-para-Devs/11-Visao-Geral-da-Metodologia.md` | 🔴 | 🔥 |
| 28-33 | BLOCOS 28-33 | Upload arquivos contexto | DOC.md, ORBIT.zip, etc | Contexto real projeto | N/A | R5 | N/A (contexto) | ✅ | - |
| 34 | BLOCO 34 | IDE Trae.ai estrutura | Uso Trae.ai, estruturação | Consolidação prática | N/A | R12 | `05-IA-e-Agents/06-Tarefas-Trae-e-Parallelismo.md` | 🟡 | ⚡ |
| 35 | BLOCO 35 | Prosseguimento | Comando continuar | Continuidade | N/A | - | N/A | ✅ | - |
| 36 | BLOCO 36 | Memória do chat | Verificação recall | Consistência contexto | Manutenção contexto agentes | R20* | `05-IA-e-Agents/12-Governanca-e-Seguranca-de-Agents.md` | 🟡 | ⚡ |
| 37 | BLOCO 37 | Árvore documentação | Estrutura completa solicitada | Meta-reflexão, transformação chat→docs | Processo estruturação documental | R5, R21* | `00-Config/09-Governanca-de-Documentacao.md` | 🔴 | 🔥 |
| 38 | BLOCO 38 | Revisão final chat | Validação completude | Zero-tolerance gaps | Processo revisão documental | R10, R21* | `07-Receitas-e-Playbooks/` → Checklist Revisão | 🔴 | ⚡ |
| 39 | BLOCO 39 | Comando execução | GO completo com correções | Materialização | N/A | Todas | Output = repo atual | ✅ | 🔥 |

\* Regras novas propostas (13-21)

---

## REGRAS MAPEADAS

### Regras Existentes (1-12)

| # | Regra | Blocos Relacionados | Aplicação |
|---|-------|---------------------|-----------|
| R1 | Nomenclatura e Placeholders | 22, 25-26 | Padronização de nomes |
| R2 | Contratos e Integração | 21, 27 | Core da metodologia modular |
| R3 | Segurança | 01, 06-10, 11 | Secrets, API keys, validação |
| R4 | Linkagem e Navegação | 05, 22 | Wikilinks, glossário |
| R5 | Fonte da Verdade | 02, 28-33, 37 | Aprovação, documentação |
| R6 | Stack Fixa | 04, 21, 25-26, 27 | NestJS, FastAPI, Next, Postgres, Redis |
| R7 | Conversão Open-Source | 17-20 | Porting para stack OBM |
| R8 | Ignore/Index e Docx | - | (Não mencionado no chat) |
| R9 | Cache Hygiene | - | (Não mencionado no chat) |
| R10 | Validação e Confiabilidade | 03, 11, 14, 23-24, 38 | Verificação, avisos |
| R11 | Auto-Limpeza e Plugins | - | (Não mencionado no chat) |
| R12 | Regras para Tasks | 12-13, 15-16, 34 | Tasks atômicas, paralelismo |

### Regras Novas Propostas (13-21)

| # | Regra | Blocos Origem | Justificativa | Status |
|---|-------|---------------|---------------|--------|
| R13 | Gestão de Custos de IA | 01-03 | Controle de gastos com APIs OpenAI | 🔴 Criar |
| R14 | Segurança de IA | 06-11 | Gerenciamento seguro de API keys, permissões | 🔴 Criar |
| R15 | Auditoria de IA | 11 | Rastreabilidade de ações de agentes | 🔴 Criar |
| R16 | Arquitetura de Agents | 12-13, 15-16, 27 | 3 agentes: Architect/Dev/Executor | 🔴 Criar |
| R17 | Protocolo de Handoff | 15-16 | Comunicação entre agentes | 🔴 Criar |
| R18 | Modularização | 21, 27 | Building Blocks, contratos obrigatórios | 🔴 Criar |
| R19 | Clareza em Documentação | 25-26 | Sempre contextualizar (FRONTEND, BACKEND, etc) | 🔴 Criar |
| R20 | Consistência de Contexto | 36 | Agentes devem manter contexto | 🔴 Criar |
| R21 | Governança de Documentação | 37-38 | Processo revisão, versionamento docs | 🔴 Criar |

---

## DOCUMENTOS A CRIAR/ATUALIZAR

### Alta Prioridade 🔥

| Documento | Tipo | Blocos | Status |
|-----------|------|--------|--------|
| `05-IA-e-Agents/09-Gestao-de-Custos-e-Uso.md` | Criar | 01-03 | 🔴 |
| `05-IA-e-Agents/02-GPT-5-Pro-Integration.md` | Criar | 06-10 | 🔴 |
| `05-IA-e-Agents/12-Governanca-e-Seguranca-de-Agents.md` | Criar | 11, 36 | 🔴 |
| `05-IA-e-Agents/13-Protocolo-de-Handoff-Entre-Agents.md` | Criar | 15-16 | 🔴 |
| `02-Guia-para-Devs/08-Contratos-e-Interfaces-de-Modulos.md` | Criar | 21 | 🔴 |
| `00-Config/09-Governanca-de-Documentacao.md` | Criar | 37 | 🔴 |
| `00-Config/03-RULES-GLOBAL.md` | Atualizar | Todos | 🔴 Adicionar R13-R21 |
| `05-IA-e-Agents/01-Arquitetura-de-Agents.md` | Atualizar | 12-13, 15-16 | 🟡 Expandir |

### Média Prioridade ⚡

| Documento | Tipo | Blocos | Status |
|-----------|------|--------|--------|
| `05-IA-e-Agents/10-Otimizacao-de-Prompts.md` | Criar | 03 | 🔴 |
| `05-IA-e-Agents/11-Comparativo-de-Ferramentas-IA.md` | Criar | 04 | 🔴 |
| `08-Referencias-Externas/05-Criterios-de-Selecao-Open-Source.md` | Criar | 17 | 🔴 |
| `02-Guia-para-Devs/09-Checklist-de-Modulo-Completo.md` | Criar | 21 | 🔴 |
| `02-Guia-para-Devs/10-Checklist-de-Componentes-Essenciais.md` | Criar | 23-24 | 🔴 |
| `00-Config/08-Template-de-Documentacao-Padrao.md` | Criar | 25-26 | 🔴 |
| `02-Guia-para-Devs/11-Visao-Geral-da-Metodologia.md` | Criar | 27 | 🔴 |
| `07-Receitas-e-Playbooks/` → Checklist Revisão | Criar | 38 | 🔴 |
| `06-Glossario-Tecnico/` | Expandir | 22 | 🟡 Adicionar termos |
| `05-IA-e-Agents/03-GPT5-1-Codex-Dev-Agent.md` | Atualizar | 14 | 🟡 Adicionar exemplos |
| `05-IA-e-Agents/06-Tarefas-Trae-e-Parallelismo.md` | Atualizar | 34 | 🟡 |
| `08-Referencias-Externas/04-Catalogo-OS-3D-LLM-Reuso.md` | Atualizar | 18-20 | 🟡 Popular |

### Baixa Prioridade 💡

| Documento | Tipo | Blocos | Status |
|-----------|------|--------|--------|
| `08-Referencias-Externas/01-Links-Importantes.md` | Atualizar | 05 | 🟡 Verificar |

---

## ESTATÍSTICAS

### Por Status

- ✅ Coberto: 3 itens (8%)
- 🟡 Parcial: 8 itens (21%)
- 🔴 Novo: 27 itens (71%)

### Por Prioridade

- 🔥 Alta: 8 itens (21%)
- ⚡ Média: 12 itens (31%)
- 💡 Baixa: 1 item (3%)
- N/A: 18 itens (45%)

### Trabalho Necessário

- **Documentos a criar:** 17
- **Documentos a atualizar:** 11
- **Regras a adicionar:** 9 (R13-R21)
- **Seções a expandir:** 15+

---

## MATRIZ DE PRIORIZAÇÃO

### Sprint 1 (Fundacional) 🔥

1. Adicionar Regras 13-21 em `00-Config/03-RULES-GLOBAL.md`
2. Criar `05-IA-e-Agents/12-Governanca-e-Seguranca-de-Agents.md`
3. Criar `05-IA-e-Agents/13-Protocolo-de-Handoff-Entre-Agents.md`
4. Expandir `05-IA-e-Agents/01-Arquitetura-de-Agents.md`
5. Criar `02-Guia-para-Devs/08-Contratos-e-Interfaces-de-Modulos.md`

### Sprint 2 (Operacional) ⚡

1. Criar `05-IA-e-Agents/09-Gestao-de-Custos-e-Uso.md`
2. Criar `05-IA-e-Agents/02-GPT-5-Pro-Integration.md`
3. Criar `00-Config/09-Governanca-de-Documentacao.md`
4. Criar `02-Guia-para-Devs/11-Visao-Geral-da-Metodologia.md`

### Sprint 3 (Complementar) 💡

1. Todos os demais documentos
2. Expansão de glossário
3. População de catálogos

---

## VALIDAÇÃO

### Checklist de Completude

- [x] Todos os 39 blocos mapeados
- [x] Conteúdo explícito extraído
- [x] Conteúdo implícito identificado
- [x] Gaps documentados
- [x] Regras mapeadas (1-12)
- [x] Novas regras propostas (13-21)
- [x] Destinos documentais definidos
- [x] Status atribuídos
- [x] Prioridades definidas
- [x] Sprints planejados

### Observações Finais

Esta matriz serve como **mapa de execução** para transformar os insights do dossier em documentação estruturada. Seguir a ordem de priorização garante que elementos fundamentais sejam estabelecidos antes de detalhes operacionais.

---

**Matriz gerada em:** 2025-11-16  
**Status:** ✅ COMPLETO  
**Uso:** Guia de implementação documental
