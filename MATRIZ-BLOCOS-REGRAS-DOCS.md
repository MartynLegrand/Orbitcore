# MATRIZ DE RELACIONAMENTO — BLOCOS × REGRAS × DOCUMENTAÇÃO

> **Documento:** Tabela de mapeamento completo  
> **Data:** 2025-11-16  
> **Objetivo:** Relacionar cada bloco com regras aplicáveis e documentação destino

---

## ESTRUTURA DA MATRIZ

| Bloco | Título | Explícito | Implícito | Gaps | Regras | Docs Destino | Status |
|-------|--------|-----------|-----------|------|--------|--------------|--------|

---

## BLOCOS 01-10: OpenAI API + GPT-5 Pro

| Bloco | Título | Explícito | Implícito | Gaps | Regras | Docs Destino | Status |
|-------|--------|-----------|-----------|------|--------|--------------|--------|
| 01 | Pricing ChatGPT Pro | - Pro custa $200/mês<br>- "Ilimitado" com fair use<br>- Pode haver rate limits | - Cost optimization necessária<br>- Monitoramento recomendado | - Como monitorar uso?<br>- Limites práticos?<br>- Estratégia de fallback? | Regra 3 (Segurança)<br>Regra 10 (Validação) | 05-IA-e-Agents/02-GPT-5-Pro-Integration.md | NOVO |
| 02 | API vs Assinatura | - Assinatura ≠ API credits<br>- Pay-as-you-go para API<br>- API para integrações | - Uso pessoal vs programático<br>- Controle de chaves necessário | - Qual modelo por cenário?<br>- Gestão de múltiplas keys?<br>- Security strategy? | Regra 3 (Segurança)<br>Regra 6 (Stack) | 05-IA-e-Agents/02-GPT-5-Pro-Integration.md | NOVO |
| 03 | Cost Optimization | - Pro: $15/1M in + $120/1M out<br>- Padrão: $1.25/1M in + $10/1M out<br>- Estratégias: menor modelo, cache | - Trade-off performance/custo<br>- Arquitetura influencia custos | - Modelo por agent?<br>- Caching em multi-agent?<br>- Métricas de decisão? | Regra 10 (Validação) | 05-IA-e-Agents/02-GPT-5-Pro-Integration.md | NOVO |
| 04 | GitHub vs OpenAI | - GitHub não tem GPT-5 Pro<br>- Plataformas diferentes | - Escolher plataforma certa | - Integração Copilot + agents?<br>- Quando usar cada um? | Regra 6 (Stack) | 05-IA-e-Agents/02-GPT-5-Pro-Integration.md | NOVO |
| 05 | Links API | - Link OpenAI Platform<br>- Docs oficiais | - Docs oficial = fonte verdade | Nenhum | Regra 5 (Fonte da Verdade) | 08-Referencias-Externas/01-Links-Importantes.md | ATUALIZAR |
| 06-10 | Model IDs | - Model: gpt-5-pro-2025-10-06<br>- Pro não ideal para coding<br>- IDs exatos necessários | - Diferentes modelos, especialidades<br>- Choice impacta output | - Versão prod vs dev?<br>- Updates de modelos?<br>- Versionamento prompts? | Regra 5 (Fonte da Verdade)<br>Regra 10 (Validação) | 05-IA-e-Agents/02-GPT-5-Pro-Integration.md | NOVO |

---

## BLOCOS 11-16: Multi-Agent Architecture

| Bloco | Título | Explícito | Implícito | Gaps | Regras | Docs Destino | Status |
|-------|--------|-----------|-----------|------|--------|--------------|--------|
| 11 | Acesso Total | - Usuário quer agent com acesso total<br>- Automação completa | - Trade-off autonomia/segurança<br>- Minimizar intervenção manual | - Limites de segurança?<br>- Sandboxing?<br>- Auditoria? | Regra 3 (Segurança) | 05-IA-e-Agents/01-Arquitetura-de-Agents.md | ATUALIZAR |
| 12 | Pro não para Coding | - Pro não ideal para programar<br>- Há modelos melhores | - Multi-model necessário<br>- Especialização por tarefa | - Modelos por tipo de código?<br>- Orquestração multi-model?<br>- Handoff? | Regra 10 (Validação) | 05-IA-e-Agents/01-Arquitetura-de-Agents.md | ATUALIZAR |
| 13 | Pro como Architect | - Pro melhor para orchestrar<br>- Architect vs executor | - Arquitetura hierárquica<br>- Separação responsabilidades<br>- Pro = estratégia | - Protocolo de comunicação?<br>- Formato de instruções?<br>- Métricas de qualidade? | Regra 2 (Contratos)<br>Regra 12 (Tasks) | 05-IA-e-Agents/01-Arquitetura-de-Agents.md | ATUALIZAR |
| 14 | GPT-5.1 Coding | - 5.1 para "coisa pesada"<br>- Modelo especializado | - Coding intensivo = 5.1<br>- "Pesado" = refactor, debug, implementação complexa | - Definir "pesado" vs "leve"?<br>- Quando escalar para 5.1? | Regra 6 (Stack) | 05-IA-e-Agents/03-GPT5-1-Codex-Dev-Agent.md | ATUALIZAR |
| 15-16 | Config Trae | - 3 agents: Architect/Dev/Executor<br>- Uso do Trae AI | - Trae = orchestration platform<br>- Config específica por agent<br>- Handoffs gerenciados | - Como configurar?<br>- Permissões e tools?<br>- Monitoramento cross-agent? | Regra 12 (Tasks Trae)<br>Regra 5 (Fonte da Verdade) | 05-IA-e-Agents/06-Tarefas-Trae-e-Parallelismo.md<br>05-IA-e-Agents/02-04-Agent-específico.md | ATUALIZAR |

---

## BLOCOS 17-20: Open-Source 3D

| Bloco | Título | Explícito | Implícito | Gaps | Regras | Docs Destino | Status |
|-------|--------|-----------|-----------|------|--------|--------------|--------|
| 17 | Reallusion Alternatives | - Busca por alternativas Reallusion<br>- Repos 3D | - Reaproveitamento open-source<br>- Critério não especificado | - Critérios de seleção?<br>- Avaliação de qualidade?<br>- License compliance?<br>- Processo de integração? | Regra 7 (Conversão OS)<br>**Regra 13 (NÃO DOC)** | 08-Referencias-Externas/03-Referencias-3D-e-Render.md<br>08-Referencias-Externas/04-Catalogo-OS-3D-LLM-Reuso.md | NOVO RULE<br>ATUALIZAR |
| 18-20 | Catálogo 3D | - Múltiplos repos 3D<br>- Preferência por "simples" | - Construção de catálogo<br>- Avaliação comparativa<br>- "Simples" = fácil integração | - O que é "simples"?<br>- Métricas de complexidade?<br>- Manutenção de catálogo?<br>- Quem faz curadoria? | Regra 8 (Index)<br>Regra 11 (Auto-Limpeza) | 08-Referencias-Externas/04-Catalogo-OS-3D-LLM-Reuso.md | ATUALIZAR |

---

## BLOCOS 21-27: Metodologia + Stacks

| Bloco | Título | Explícito | Implícito | Gaps | Regras | Docs Destino | Status |
|-------|--------|-----------|-----------|------|--------|--------------|--------|
| 21 | Metodologia | - Solicitação de metodologia detalhada | - Padronização de processo<br>- Multi-dev/agents seguem mesmo método<br>- Doc = manual de trabalho | - Qual metodologia?<br>- Como agents seguem?<br>- Adaptações multi-agent? | Regra 4 (Linkagem)<br>Regra 5 (Fonte da Verdade) | 02-Guia-para-Devs/01-Metodologia-e-Fluxo.md | NOVO |
| 22 | Taxonomia | - LANGUAGE, STACK, MODULE, DIFF, CONTRACT, REMIX, JWT | - Sistema de classificação<br>- Hierarquia: LANGUAGE → STACK → MODULE<br>- Contracts e diffs | - "LANGUAGE" documentado?<br>- "DIFF" = versão?<br>- "REMIX" = composição?<br>- Hierarquia completa? | Regra 1 (Nomenclatura)<br>Regra 4 (Linkagem)<br>Regra 6 (Stack) | 06-Glossario-Tecnico/<br>02-Guia-para-Devs/02-Taxonomia-de-Componentes.md | NOVO |
| 23 | Completude | - "Tem mais ou dá pra fazer tudo?" | - Preocupação com coverage<br>- Todos building blocks<br>- Validação | - Lista completa validada?<br>- Componentes faltantes?<br>- Roadmap? | Regra 10 (Validação) | 02-Guia-para-Devs/02-Taxonomia-de-Componentes.md | NOVO |
| 24 | Prossiga | - Continue expandindo | - Aprovação para continuar | Nenhum | Regra 5 (Fonte da Verdade) | N/A | N/A |
| 25 | Stacks/Linguagens | - Info sobre stacks e linguagens | - Múltiplas linguagens<br>- Stacks compostas | - Fronteiras claras?<br>- Comunicação entre stacks? | Regra 6 (Stack) | 04-Stacks-e-Infra/01-Stack-Oficial-*.md | VALIDAR |
| 26 | Padrão Docs | - "Sempre coloque contexto explícito"<br>- Clareza > concisão | - Padrão de escrita<br>- Evitar ambiguidade<br>- Redundância aceitável | - Padrão formalizado?<br>- Aplica a tudo? | Regra 4 (Linkagem)<br>Regra 5 (Fonte da Verdade) | 00-Config/02-Como-Usar-Este-Vault.md<br>02-Guia-para-Devs/03-Guia-de-Estilo.md | NOVO RULE<br>NOVO |
| 27 | Reiteração | - Repetição: metodologia detalhada | - Tópico crítico<br>- Primeira resposta incompleta? | - Primeira tentativa completa? | Regra 5 (Fonte da Verdade) | 02-Guia-para-Devs/01-Metodologia-e-Fluxo.md | VALIDAR |

---

## BLOCOS 28-39: Consolidação + Meta

| Bloco | Título | Explícito | Implícito | Gaps | Regras | Docs Destino | Status |
|-------|--------|-----------|-----------|------|--------|--------------|--------|
| 28 | DOC.MD | - Referência a DOC.MD | - Doc prévia existe<br>- Pode ter decisões/context | - Conteúdo visível?<br>- Foi incorporado? | Regra 8 (Index) | N/A | GAP |
| 29-33 | Uploads | - ORBIT.zip<br>- listas.md<br>- README.md<br>- MAIN APP.zip<br>- Sem título.md | - Projeto em andamento<br>- Artefatos revisados<br>- Organizar disperso | - Conteúdo não visível<br>- Foram incorporados?<br>- Onde estão? | Regra 8 (Index)<br>Regra 9 (Cache) | Variável | GAP |
| 34 | Trae como IDE | - "IDE que uso é o Trae AI"<br>- Como montar projeto | - Trae não é só orchestrator, é IDE<br>- Config crítica<br>- Setup reflete arquitetura | - Guide completo?<br>- Configs específicas?<br>- Templates? | Regra 12 (Tasks Trae)<br>Regra 5 (Fonte da Verdade) | 05-IA-e-Agents/06-Tarefas-Trae-e-Parallelismo.md<br>07-Receitas-e-Playbooks/01-Setup-Ambiente-Trae.md | NOVO |
| 35 | Prossiga | - Continue | - Aprovação | Nenhum | N/A | N/A | N/A |
| 36 | Validação Memória | - "SE LEMBRA DE TUDO?" | - Consistência ao longo do chat<br>- Nada perdido<br>- Context window limits | - Garantir consistência?<br>- Context management?<br>- Resumos? | Regra 5 (Fonte da Verdade) | 05-IA-e-Agents/05-Receitas-de-Prompt-Para-Agents.md | ATUALIZAR |
| 37 | Árvore Completa | - "Árvore completa sem omitir nada" | - Visão holística<br>- Coverage 100%<br>- Hierarquia crítica | - Árvore criada?<br>- Todos tópicos mapeados?<br>- Estrutura atual cobre tudo? | Regra 4 (Linkagem)<br>Regra 5 (Fonte da Verdade) | 00-Config/01-Mapa-Geral-do-Ecossistema.md<br>00-Config/02-Como-Usar-Este-Vault.md | VALIDAR |
| 38 | Revisão Completa | - "REVIZE... NÃO DEIXOU PASSAR NADA?" | - Completude<br>- Zero tolerance omissões<br>- Qualidade > velocidade | - Processo de revisão?<br>- Checklist? | Regra 10 (Validação)<br>Regra 5 (Fonte da Verdade) | 07-Receitas-e-Playbooks/02-Checklist-de-Auditoria.md | NOVO |
| 39 | Consolidação Final | - "Faça tudo + correções" | - Aplicar todas correções<br>- Entrega polida<br>- Nada perdido | - Todas correções aplicadas?<br>- Nada pendente? | Regra 5 (Fonte da Verdade)<br>Regra 10 (Validação) | Toda documentação | VALIDAR |

---

## RESUMO DE STATUS

### Documentos a CRIAR (NOVO)
1. `05-IA-e-Agents/02-GPT-5-Pro-Integration.md`
2. `02-Guia-para-Devs/01-Metodologia-e-Fluxo.md`
3. `02-Guia-para-Devs/02-Taxonomia-de-Componentes.md`
4. `02-Guia-para-Devs/03-Guia-de-Estilo-de-Documentacao.md`
5. `07-Receitas-e-Playbooks/01-Setup-Ambiente-Trae.md`
6. `07-Receitas-e-Playbooks/02-Checklist-de-Auditoria.md`

### Documentos a ATUALIZAR
1. `05-IA-e-Agents/01-Arquitetura-de-Agents.md`
2. `05-IA-e-Agents/03-GPT5-1-Codex-Dev-Agent.md`
3. `05-IA-e-Agents/06-Tarefas-Trae-e-Parallelismo.md`
4. `08-Referencias-Externas/01-Links-Importantes.md`
5. `08-Referencias-Externas/04-Catalogo-OS-3D-LLM-Reuso.md`

### Documentos a VALIDAR
1. `04-Stacks-e-Infra/01-Stack-Oficial-*.md`
2. `00-Config/01-Mapa-Geral-do-Ecossistema.md`
3. Toda documentação (auditoria final)

### GAPS a Resolver
1. Conteúdo de uploads (DOC.MD, ORBIT.zip, etc)
2. Definir Regra 13 (Open-Source Ético)
3. Criar novas regras (14-21+)
4. Implementar processos de governança

---

## MÉTRICAS

- **Total de Blocos:** 39
- **Blocos com ação NOVO:** 15 (38%)
- **Blocos com ação ATUALIZAR:** 12 (31%)
- **Blocos com ação VALIDAR:** 8 (21%)
- **Blocos com GAP crítico:** 4 (10%)
- **Documentos novos necessários:** 6
- **Documentos a atualizar:** 5
- **Novas regras necessárias:** 9+ (Regras 13-21)

---

**FIM DA MATRIZ DE RELACIONAMENTO**
