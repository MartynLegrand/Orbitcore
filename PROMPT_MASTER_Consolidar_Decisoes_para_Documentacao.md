# PROMPT MASTER — **Consolidar Decisões do Dossiê em Documentação Final (PT‑BR)**

> **Objetivo:** A partir do **DOSSIÊ ANOTADO** (texto integral dos blocos do chat, com “TEXTO ORIGINAL” + “NOTAS DE CONCLUSÃO”), **extraia somente o que foi realmente decidido como ideal** e produza uma **DOCUMENTAÇÃO FINAL** precisa, sem ambiguidades, **citando os blocos de origem** em cada afirmação normativa.  
> **Saída obrigatória:** um **único arquivo Markdown (.md)**, estruturado conforme este prompt, com **rastreabilidade por bloco** (ex.: `[ref: B12, B14]`).

---

## 🔷 ENTRADA (COLE ABAIXO O DOSSIÊ ANOTADO, SEM ALTERAR)

> Cole o conteúdo completo do dossiê (com todos os **BLOCO NN**), **sem remover nada**, no campo abaixo.  
> **Importante:** NÃO resuma, NÃO edite o texto do dossiê — ele deve apenas servir de **fonte** para extração de decisões.

```md
{{DOSSIÊ_MARKDOWN}}
```

---

## 🔷 REGRAS OBRIGATÓRIAS (SIGA À RISCA)

1. **Preservação da fonte:** Use o dossiê apenas como **fonte de verdade**. **Não invente** requisitos fora do que foi definido.
2. **Escopo:** Extraia **apenas** o que foi **decidido como ideal / recomendado / padrão** (normativo). Ignore opiniões tentativas que foram superadas.
3. **Rastreabilidade:** Toda decisão no documento final deve citar os **BLOCOS de origem** no formato: `[ref: B03, B17]` (use sempre o número real do bloco).
4. **Conflitos:** Se houver contradições entre blocos, **prefira a decisão mais recente** (bloco com número maior). Liste as divergências resolvidas na seção **“Conflitos e Resoluções”**.
5. **Sem ambiguidade:** Use linguagem **normativa** (“**DEVE**”, “**NÃO DEVE**”, “**PODE**”) com formulários claros de contrato. Nada de “talvez”/“idealmente”.
6. **Sem reescrever a fonte:** As citações do dossiê, quando necessárias, devem ser **curtas** (no máximo 1–2 linhas) e **marcadas como citação** (`>`), sempre com `[ref: BNN]`.
7. **Português (PT‑BR):** Texto técnico, direto, consistente; títulos em **Caixa Título** e termos padronizados ao longo do documento.
8. **Saída única:** Entregar **1 arquivo .md** único contendo **(A)** extração consolidada + **(B)** a documentação final estruturada + **(C)** matrizes de rastreabilidade e glossário.

---

## 🔷 PROTOCOLO DE EXECUÇÃO (.TASK)

**[TASK 1 — INVENTÁRIO DE BLOCOS]**  
1.1. Liste todos os blocos (**B01, B02, …**), com o **título** que aparece no dossiê (se houver) ou derive um título de até 12 palavras da primeira linha do “Você disse:”.  
1.2. Para cada bloco, identifique **decisões explícitas** (sinais: “usar X”, “ID correto é Y”, “NÃO DEVE”, “Padrão”, “Regra”, “Proibido”, “Stack”, “Modelo”, “Contrato”, etc.).  
1.3. Gere uma **tabela `Bloco → Decisões encontradas`**, mantendo o texto original das decisões o mais próximo possível do sentido dado.

**[TASK 2 — NORMALIZAÇÃO]**  
2.1. Deduplicate (mesma decisão em blocos diferentes).  
2.2. Uniformize verbos e substantivos (ex.: “Model ID”, “Stack Oficial Martyn”, “Protocolo .TASK”).  
2.3. Resolva conflitos: **preferir blocos mais novos**; se persistir, manter **ambas** as leituras e abrir **“Questão em Aberto”**.  
2.4. Classifique cada decisão em **categorias**: _Modelos_, _API/Keys/Permissões_, _Arquitetura Modular_, _Módulos_, _Segurança_, _Stacks/Linguagens_, _Agentes/Orquestração_, _Open‑source/Reuso_, _DevOps/Deploy_, _Documentação_, _Outros_.

**[TASK 3 — RASTREABILIDADE]**  
3.1. Para **cada decisão final**, anexe **[ref: BNN, …]**.  
3.2. Gere a **Matriz de Rastreabilidade**: _Decisão → Blocos que a sustentam_.  
3.3. Gere a **Matriz Seção → Blocos** (quais blocos alimentam cada seção da documentação final).

**[TASK 4 — DOCUMENTAÇÃO FINAL (.MD)]**  
Produza **apenas agora** o documento final, no formato abaixo, consolidando **somente as decisões finais** (normativas), com citações `[ref: BNN]` em cada item.

---

## 🔷 ESTRUTURA OBRIGATÓRIA DA DOCUMENTAÇÃO FINAL

> **Título do arquivo:** `Documentacao_Final_Ecossistema_Martyn.md`

### 1. Introdução
- Propósito deste documento.  
- Escopo e o que **está**/**não está** coberto.  
- Fonte oficial: **Dossiê do Chat Anotado** (blocos BNN).

### 2. Visão Geral do Ecossistema
- Resumo objetivo do que foi decidido para a plataforma modular, agentes, módulos e integração. `[ref: …]`

### 3. Decisões Normativas (Consolidadas)
> Lista **curta e direta** de decisões centrais, com **verbo normativo** e **[ref: BNN]** por item.  
Ex.:  
- “**DEVE** usar `gpt-5-pro` como **Model ID** do GPT‑5 Pro.” `[ref: B12]`  
- “**DEVE** conceder **ALL → WRITE** nas permissões de API quando perfil exigir automação total.” `[ref: B13, B14]`  
- “**DEVE** adotar o **Protocolo .TASK (Análise → Plano → Execução)** para evitar reescritas indevidas.” `[ref: Bxx]`

### 4. Arquitetura Modular (Protocolo Martyn)
- Definição de **módulo** (responsabilidade única, contrato, docs). `[ref: …]`  
- Padrões de **conexão** (REST/GraphQL, SDK, microserviço). `[ref: …]`  
- **Contrato padrão** (entradas/saídas/erros + headers). `[ref: …]`  
- **Documentação mínima obrigatória** por módulo (README, API, ARCHITECTURE, INTEGRATION, exemplos). `[ref: …]`

### 5. Stacks e Linguagens
- **Stack Oficial Martyn** (linguagem principal, backend padrão, frontend padrão, IA, 3D/performance). `[ref: …]`  
- Critérios de escolha (quando usar TypeScript/Python/Go/Rust). `[ref: …]`  
- Trade‑offs e limitações (performance, custo, complexidade). `[ref: …]`

### 6. Segurança
- **JWT assinado + expirado**, **RBAC (roles)**, **Secrets em .env/secret manager**, **TLS/HTTPS**. `[ref: …]`  
- Padrões de auditoria (**Audit Log**), rate‑limit, proteção extra. `[ref: …]`

### 7. Agentes (OpenAI) e Orquestração
- Papéis oficiais: **GPT‑5 Pro Architect**, **GPT‑5.1 Codex Dev**, **GPT‑5 Executor**. `[ref: …]`  
- Divisão de responsabilidades e **handoff** entre agentes. `[ref: …]`  
- Políticas de **permissões** (ALL → WRITE quando necessário). `[ref: …]`  
- **Protocolo .TASK** para trabalho em etapas. `[ref: …]`

### 8. API/Modelos/Permissões (OpenAI)
- **Model IDs** oficiais (ex.: `gpt-5-pro`, `gpt-5.1-codex`, etc.). `[ref: …]`  
- **Regras de preenchimento** dos campos (Provider, Model, Model ID, API Key). `[ref: …]`  
- **Permissões**: o que **DEVE** estar em WRITE para cada caso. `[ref: …]`

### 9. DevOps/Deploy
- Docker/docker‑compose por módulo. `[ref: …]`  
- Ambientes, .env, CI/CD básico. `[ref: …]`  
- Padrões de observabilidade (logs, métricas, tracing). `[ref: …]`

### 10. Boas Práticas Operacionais
- “Não reescrever tudo” (alteração mínima, diffs). `[ref: …]`  
- “Somente UI/layout” (limites de edição). `[ref: …]`  
- “Perguntar antes de assumir” (regra de ouro). `[ref: …]`

### 11. Conflitos e Resoluções
- Tabela com conflitos detectados e decisão final escolhida (com `[ref: BNN]` de ambos os lados).

### 12. Matriz de Rastreabilidade
- **Decisão → Blocos** (linhas por decisão).  
- **Seção → Blocos** (quais blocos alimentam cada seção).

### 13. Glossário Referencial
- Termos que aparecem no documento (API, JWT, RBAC, TLS/HTTPS, Stack, etc.), definidos em PT‑BR. `[ref: …]`

### 14. Anexos (Opcional)
- Snippets, diffs, exemplos de config (curtos), sempre com `[ref: BNN]`.

---

## 🔷 POLÍTICAS DE CITAÇÃO E CONFLITOS

- **Citação curta:** Quando necessário, use blocos de citação `>` com até **duas linhas**, seguidos de `[ref: BNN]`.
- **Conflitos:** Preferir bloco **mais recente**. Se irreconciliável, marcar **Questão em Aberto** e listar possíveis leituras com `[ref: …]`.
- **Silêncio da fonte:** Se algo importante não aparece no dossiê, **não invente**; crie um item “⚠ Informação faltante” na seção pertinente.

---

## 🔷 FORMATO FINAL (SAÍDA ÚNICA .MD)

- Arquivo **único** chamado: `Documentacao_Final_Ecossistema_Martyn.md`.
- Deve conter **todas as seções** descritas acima.
- Cada decisão/seção tem **[ref: BNN]** que aponta para os blocos do dossiê.

---

## 🔷 CHECKLIST DE QUALIDADE (AUTO-VALIDAÇÃO)

- [ ] Todas as decisões têm **[ref: BNN]**.  
- [ ] Conflitos resolvidos ou marcados como “Questão em Aberto”.  
- [ ] Linguagem **normativa** (“DEVE”, “NÃO DEVE”, “PODE”).  
- [ ] Sem ambiguidades, sem “talvez”.  
- [ ] Nada inventado além da fonte (dossiê).  
- [ ] Glossário presente.  
- [ ] Matriz de rastreabilidade presente.  
- [ ] Saída em **um único .md**.

---

## 🔷 OBSERVAÇÃO FINAL

Este prompt **não altera** o dossiê original; ele **organiza e consolida** o que foi decidido como padrão.  
Se o dossiê for atualizado, **reexecute** o processo usando a versão mais recente para manter a documentação sincronizada.
