# PROMPT MASTER — **Ponta a Ponta** → Consolidar o DOSSIÊ em **Documentação Final Perfeita (PT‑BR)**

> **Objetivo**  
> A partir do **DOSSIÊ ANOTADO** do chat (com BLOCOS contendo **TEXTO ORIGINAL** e **NOTAS DE CONCLUSÃO**), **extraia somente as decisões realmente finalizadas (o que foi definido como ideal)** e gere uma **DOCUMENTAÇÃO FINAL única em Markdown**, **precisa**, **normativa** e **sem ambiguidades**, **citando os blocos de origem** em cada item normativo.
>
> **Saída obrigatória**: **1 único arquivo `.md`** chamado **`Documentacao_Final_Ecossistema_Martyn.md`** seguindo a estrutura e as regras deste prompt.  
> **Rastreabilidade**: cada decisão deve trazer `[ref: BNN]` apontando para o(s) bloco(s) correspondente(s) do dossiê.

---

## 🔷 ENTRADA (COLE O DOSSIÊ INTEGRAL ABAIXO, SEM ALTERAR)

> Cole **o dossiê completo** (com todos os `BLOCO NN`) no campo abaixo. **Não edite o conteúdo do dossiê**; ele é a **fonte de verdade**.

```md
{{DOSSIÊ_MARKDOWN}}
```

---

## 🔷 REGRAS GERAIS (OBRIGATÓRIAS)

1. **Preservação da fonte**: Não invente. Extraia **somente** o que está decidido no dossiê (normativo, final, “ideal”).  
2. **Linguagem normativa**: use “**DEVE**”, “**NÃO DEVE**”, “**PODE**” quando for regra/padrão. Evite “talvez”, “idealmente”, “poderia”.  
3. **Rastreabilidade**: toda decisão/afirmação normativa deve citar os blocos de origem no formato **`[ref: B03, B17]`** (use números reais dos blocos).  
4. **Conflitos**: se houver decisões contraditórias, **prefira o bloco mais recente** (maior número). Liste as divergências em **“Conflitos e Resoluções”**.  
5. **Sem reescrever a fonte**: Quando citar trechos do dossiê, use citação curta `>` com no máximo 2 linhas, sempre acompanhada de `[ref: BNN]`.  
6. **PT‑BR técnico**: mantenha consistência de termos (Model ID, Protocolo .TASK, Stack Oficial Martyn, etc.).  
7. **Formato único**: entregue **um único arquivo `.md`** com **todas** as seções obrigatórias.  
8. **Lacunas**: quando informações necessárias não constarem no dossiê, **não invente**; escreva “**⚠ Informação faltante (especificar)**” na seção pertinente.  
9. **Nada de conteúdo sensível inventado**: não fabrique chaves, segredos, URLs reais; use placeholders quando necessário.  
10. **Coerência temporal**: se regras evoluíram ao longo dos blocos, registre **apenas o estado final** (e documente conflitos resolvidos).

---

## 🔷 PROTOCOLO DE EXECUÇÃO (.TASK) — SIGA EM ORDEM

**[TASK 1 — Inventário de Blocos]**  
1.1. Liste **todos os blocos** (B01, B02, …), com **título** derivado da primeira linha “Você disse:” (até 12 palavras).  
1.2. Em cada bloco, **colete decisões finais** e itens normativos (sinais: “usar X”, “o ID correto é Y”, “DEVE/NÃO DEVE”, “Padrão”, “Regra”, “Proibido”, “Stack oficial”, “Protocolo”, “Contrato”, etc.).  
1.3. Gere uma **tabela** “**Bloco → Decisões candidatas**” (mantendo o sentido original).

**[TASK 2 — Normalização e Consolidação]**  
2.1. Elimine duplicatas (mesma decisão em múltiplos blocos).  
2.2. Uniformize termos (ex.: **Model ID**, **Stack Oficial Martyn**, **Protocolo .TASK**, **Regra de Ouro**).  
2.3. **Resolva conflitos** preferindo blocos mais recentes; anote em “Conflitos e Resoluções”.  
2.4. Classifique cada decisão consolidada nas **categorias**:  
   - Modelos / API / Permissões (OpenAI)  
   - Arquitetura Modular / Módulos / Contratos  
   - Fábrica de Apps / Module Registry / Templates  
   - Agentes e Orquestração (GPT‑5 Pro Architect / GPT‑5.1 Codex Dev / GPT‑5 Executor)  
   - Stacks e Linguagens / Stack Oficial Martyn  
   - Segurança (JWT, RBAC, Secrets, TLS/HTTPS, Audit Log)  
   - DevOps/Deploy (Docker, Compose, CI/CD, Observabilidade)  
   - Boas Práticas Operacionais (não reescrever tudo; UI-only; Regra de Ouro)  
   - Reuso Open‑Source Ético  
   - Outros

**[TASK 3 — Rastreabilidade]**  
3.1. Para **cada decisão final**, anexe `[ref: BNN, …]`.  
3.2. Monte a **Matriz Decisão → Blocos**.  
3.3. Monte a **Matriz Seção → Blocos** (quais blocos alimentam cada seção da documentação).

**[TASK 4 — Geração da Documentação Final (.md)]**  
4.1. Produza o documento seguindo **exatamente** a **estrutura obrigatória** abaixo.  
4.2. Em cada item normativo, inclua `[ref: …]`.  
4.3. Onde faltar dado, insira “⚠ Informação faltante (… )”.

**[TASK 5 — Validação Final]**  
5.1. Cheque: todas as decisões têm `[ref: …]`? Há glossário? Há matrizes? Conflitos foram resolvidos?  
5.2. Sem ambiguidades. Sem invenções. Linguagem consistente.  
5.3. Nome do arquivo final: **`Documentacao_Final_Ecossistema_Martyn.md`**.

---

## 🔷 ESTRUTURA OBRIGATÓRIA DA **DOCUMENTAÇÃO FINAL** (SAÍDA)

> **Título do arquivo**: `Documentacao_Final_Ecossistema_Martyn.md`

### 1. Introdução
- Propósito do documento e escopo.  
- Fonte oficial: **Dossiê do Chat Anotado** (blocos BNN). `[ref: …]`

### 2. Visão Geral do Ecossistema
- Resumo do ecossistema modular, agentes, fábrica de apps, guidelines. `[ref: …]`

### 3. Decisões Normativas (Consolidadas)
> **Lista direta**, com verbo normativo e referências. Exemplos de forma:  
- **DEVE** usar `gpt-5-pro` como **Model ID** do GPT‑5 Pro. `[ref: B12]`  
- **DEVE** aplicar **ALL → WRITE** quando o perfil exigir automação total. `[ref: B13, B14]`  
- **DEVE** adotar o **Protocolo .TASK (Análise → Plano → Execução)**. `[ref: Bxx]`  
- **NÃO DEVE** reescrever módulos por padrão; priorizar **alteração mínima / diff**. `[ref: …]`

### 4. Arquitetura Modular (Protocolo Martyn)
- **Definição de módulo** (responsabilidade única, contrato, docs mínimas). `[ref: …]`  
- **Contratos de integração** (REST/GraphQL, SDK, Microserviços). `[ref: …]`  
- **Contrato padrão** (entradas/saídas/erros + headers/códigos). `[ref: …]`  
- **Documentação mínima por módulo**: `README.md`, `API.md`, `ARCHITECTURE.md`, `INTEGRATION.md`, exemplo de uso. `[ref: …]`  
- **Limites de edição** (UI-only; markers `LAYOUT_START/END`). `[ref: …]`

### 5. Fábrica de Apps (CLI, Templates, Module Registry)
- **Estrutura de repositórios** (core, modules, apps). `[ref: …]`  
- **CLI e templates** (`martyn new`, `martyn add module`). `[ref: …]`  
- **Module Registry** (descoberta e versionamento de módulos). `[ref: …]`

### 6. Agentes e Orquestração (OpenAI)
- Papéis oficiais: **🟦 GPT‑5 Pro Architect**, **🟧 GPT‑5.1 Codex Dev**, **🟩 GPT‑5 Executor**. `[ref: …]`  
- Divisão de responsabilidades, **handoff** entre agentes, **Regra de Ouro** (perguntar antes de assumir). `[ref: …]`  
- **Protocolo .TASK** obrigatório para evitar erros e reescritas. `[ref: …]`

### 7. Stacks e Linguagens
- **Stack Oficial Martyn** (principal/apoio; quando usar TS, Python, Rust/Go). `[ref: …]`  
- Critérios e trade‑offs (performance, custo, complexidade). `[ref: …]`  
- Padrões de módulos por stack (backend, frontend, IA/3D). `[ref: …]`

### 8. Segurança
- **JWT assinado e expirado**, **RBAC (roles)**, **Secrets em `.env`/secret manager**, **TLS/HTTPS** obrigatório. `[ref: …]`  
- **Audit Log** para ações críticas; rate‑limit; políticas de permissão. `[ref: …]`

### 9. API / Modelos / Permissões (OpenAI)
- **Model IDs oficiais** (ex.: `gpt-5-pro`, `gpt-5.1-codex`, etc.) e **regras de preenchimento** (Provider, Model, Model ID, API Key). `[ref: …]`  
- **Permissões**: quando e por que usar **ALL → WRITE**; significado de **REQUEST**. `[ref: …]`  
- Exemplos mínimos de chamadas (apenas se constarem do dossiê). `[ref: …]`

### 10. DevOps / Deploy / Observabilidade
- **Docker**/`docker-compose` por módulo; ambientes; `.env`; **CI/CD** básico. `[ref: …]`  
- **Logs, métricas e tracing** (observabilidade). `[ref: …]`

### 11. Boas Práticas Operacionais
- **Alteração mínima** (patch/diff), **UI‑only** quando indicado; **não reescrever** sem necessidade. `[ref: …]`  
- **Reuso open‑source ético** (licenças, cabeçalhos, créditos). `[ref: …]`  
- **Regra de Ouro**: em dúvida, **perguntar** antes de assumir. `[ref: …]`

### 12. Conflitos e Resoluções
- Tabela **Conflito → Decisão Final** (com `[ref: BNN]` de ambos os lados).  
- “Questões em Aberto” se algo permanecer inconcluso.

### 13. Matrizes de Rastreabilidade
- **Matriz Decisão → Blocos** (linhas por decisão).  
- **Matriz Seção → Blocos** (quais blocos sustentam cada seção).

### 14. Glossário Referencial
- Termos técnicos usados (API, Model ID, Protocolo .TASK, Stack, JWT, RBAC, TLS/HTTPS, etc.). `[ref: …]`

### 15. Anexos (Opcional)
- Snippets, diffs, exemplos de config curtos (somente se constarem do dossiê). `[ref: …]`

---

## 🔷 POLÍTICAS ESPECÍFICAS (MENCIONE EXPLICITAMENTE NO DOCUMENTO, COM REFERÊNCIAS)

- **Reuso open‑source ético**: manter licenças/cabeçalhos; não “reescrever GPL e vender fechado”; pode integrar por API/SDK/serviço; citar fonte. `[ref: …]`  
- **Regra de Ouro Martyn**: “Se houver mais de uma interpretação possível, **PARAR e perguntar**.” `[ref: …]`  
- **Protocolo .TASK**: `ANÁLISE → PLANO → EXECUÇÃO` (nunca pular etapas; execução só com aprovação). `[ref: …]`  
- **Limites de edição de UI**: alterar só HTML/JSX/CSS quando pedido; **proibido** mudar lógica/hook/chamadas sem aprovação. `[ref: …]`  
- **Permissões de API (OpenAI)**: quando habilitar **ALL → WRITE** e o que significa **REQUEST**. `[ref: …]`  
- **Model IDs corretos** (sem sufixos de data; ex.: `gpt-5-pro`, **não** `gpt-5-pro-2025-10-06`). `[ref: …]`

---

## 🔷 ESTILO, FORMATAÇÃO E TÉCNICAS

- **PT‑BR técnico**, claro e direto.  
- Tabelas para endpoints/contratos; listas para decisões; `code fences` para exemplos e `.env`.  
- Citações **curtas** com `>` + `[ref: BNN]`.  
- Em todas as seções normativas, **incluir referências**.  
- **Consistência de nomenclatura** (ex.: “Stack Oficial Martyn”, “Protocolo .TASK”, “Regra de Ouro”).  
- **Sem texto redundante**; foco no **estado final** decidido.  
- **Sem menções a este prompt** no documento final.

---

## 🔷 CHECKLIST DE QUALIDADE (AUTO‑VALIDAÇÃO)

- [ ] Todas as decisões têm **[ref: BNN]**.  
- [ ] Conflitos resolvidos ou marcados como “Questão em Aberto”.  
- [ ] Linguagem **normativa** (DEVE/NÃO DEVE/PODE).  
- [ ] Nada inventado além do dossiê.  
- [ ] Glossário presente. Matrizes presentes.  
- [ ] Estrutura cumprida 1→15.  
- [ ] Arquivo único: **`Documentacao_Final_Ecossistema_Martyn.md`**.

---

## 🔷 NOTAS FINAIS

- Este prompt **não altera** o dossiê; apenas consolida decisões em documentação final.  
- Se o dossiê for atualizado, **replique este processo** com a versão mais recente.
