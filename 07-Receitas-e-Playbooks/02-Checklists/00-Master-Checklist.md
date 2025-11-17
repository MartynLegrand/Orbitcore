# Master Checklist - 21 Regras OBM ✅

> **Versão:** 1.0
> **Data:** 2025-11-16
> **Uso:** Validação completa de compliance para qualquer módulo ou task

## Como Usar Este Checklist

1. **Marque cada item** conforme validar
2. **Documente evidências** quando relevante
3. **Anote N/A** se regra não se aplica
4. **100% de compliance** é obrigatório antes de merge

---

## Regras 1-12: Fundação Original

### R1: Nomenclatura e Placeholders ✅
- [ ] Módulos usam prefixo `obm-*`
- [ ] Sem uso de prefixo "martyn" em nomes
- [ ] Apps referenciados via placeholders `{{APP_NAME}}`
- [ ] Nomenclatura consistente (camelCase, kebab-case conforme padrão)

**Evidência:** [Listar módulos/arquivos validados]

---

### R2: Contratos e Integração ✅
- [ ] APIs claramente definidas (REST/GraphQL/gRPC)
- [ ] DTOs/Schemas tipados (TypeScript/Pydantic)
- [ ] Endpoints documentados (OpenAPI/Swagger)
- [ ] Códigos de erro padronizados
- [ ] SDKs disponíveis (JS/TS e/ou Python)
- [ ] Health check (`/health`) implementado

**Evidência:** [Link para docs de API]

---

### R3: Segurança 🔒
- [ ] Secrets via environment variables (nunca hardcoded)
- [ ] Autenticação implementada (JWT/OAuth onde aplicável)
- [ ] Validação de inputs (DTOs com class-validator/Pydantic)
- [ ] RBAC configurado (se aplicável)
- [ ] Rate limiting implementado
- [ ] Logs não expõem dados sensíveis
- [ ] HTTPS configurado em produção

**Evidência:** [Checklist de segurança completo]

---

### R4: Linkagem e Navegação
- [ ] Termos técnicos linkados para glossário
- [ ] Navegação bidirecional entre conceitos
- [ ] Wikilinks funcionando (Obsidian)
- [ ] Links internos não quebrados

**Evidência:** [Arquivos de docs verificados]

---

### R5: Fonte da Verdade ⚖️
- [ ] Documentação não foi alterada sem autorização
- [ ] Mudanças de regras aprovadas explicitamente
- [ ] Fonte da verdade respeitada (00-Config/)

**Evidência:** [Aprovações documentadas]

---

### R6: Stack Fixa 🛠️
- [ ] Backend: NestJS (TS) ou FastAPI (Python)
- [ ] Frontend: Next.js (React) - se aplicável
- [ ] Database: Postgres + Redis
- [ ] ORM: Prisma (NestJS) ou SQLAlchemy (FastAPI)
- [ ] Queue: BullMQ (Redis)
- [ ] Container: Docker
- [ ] Sem desvios da stack oficial sem aprovação

**Evidência:** [package.json / requirements.txt verificado]

---

### R7: Conversão de Open-Source
- [ ] Contratos preservados ao adaptar código OS
- [ ] Camadas de adaptação documentadas
- [ ] Testes de compatibilidade incluídos
- [ ] Diferenças documentadas

**Evidência:** [Docs de adaptação]

---

### R8: Ignore/Index e Docx
- [ ] `.gitignore` configurado (logs, binários, cache, builds)
- [ ] Arquivos irrelevantes excluídos do índice
- [ ] Conversão de .docx para .md aplicada (se necessário)

**Evidência:** [.gitignore verificado]

---

### R9: Cache Hygiene
- [ ] Caches limpos após atualização de documentação
- [ ] Operação de limpeza registrada
- [ ] Impactos documentados

**Evidência:** [Log de limpeza]

---

### R10: Validação e Confiabilidade ✔️
- [ ] Método de verificação disponível
- [ ] Avisos de armadilhas documentados
- [ ] Abordagens seguras recomendadas
- [ ] Sem sugestões que possam causar falhas

**Evidência:** [Testes e validações]

---

### R11: Prompts de Auto-Limpeza
- [ ] Wikilinks verificados (não quebrados)
- [ ] Arquivos órfãos removidos
- [ ] Imagens otimizadas
- [ ] Índices reconstruídos
- [ ] Plugins recomendados documentados

**Evidência:** [Relatório de limpeza]

---

### R12: Regras para Tasks (Trae)
- [ ] Tasks atômicas com objetivo claro
- [ ] Entradas e saídas definidas
- [ ] Progresso reportado
- [ ] Lacunas documentadas
- [ ] Propostas apresentadas

**Evidência:** [Tasks documentadas]

---

## Regras 13-21: Novas Regras Críticas

### R13: Reaproveitamento Open-Source Ético 📜
- [ ] Licenças de dependências verificadas
- [ ] Apenas MIT/Apache/BSD/ISC ou compatíveis
- [ ] Avisos de licença preservados
- [ ] `CREDITS.md` ou `LICENSE` presente
- [ ] Atribuições corretas mantidas
- [ ] Nenhuma violação de GPL (se aplicável)
- [ ] Documentação de dependências em `package.json`/`requirements.txt`

**Evidência:** [Relatório de licenças]

**Ferramentas:**
```bash
# Node.js
npx license-checker --summary

# Python
pip-licenses --format=markdown
```

---

### R14: IA: Não Reescreve Tudo ✂️
- [ ] Alterações cirúrgicas e mínimas (< 200 linhas típico)
- [ ] Código funcional preservado
- [ ] Sem reescritas completas de arquivos
- [ ] Funções públicas não alteradas (sem breaking changes)
- [ ] Stack não trocada sem justificativa
- [ ] Diffs revisados por tamanho
- [ ] Justificativa para mudanças grandes (se > 200 linhas)

**Evidência:** [Git diff statistics]

**Validação:**
```bash
git diff --stat main...HEAD
```

---

### R15: Protocolo .TASK (3 Fases) 📋
- [ ] **FASE 1 (ANÁLISE):** Concluída sem gerar código
- [ ] **FASE 2 (PLANO):** Aprovado antes de executar
- [ ] **FASE 3 (EXECUÇÃO):** Seguindo plano aprovado
- [ ] Documentos de cada fase criados
- [ ] Handoffs documentados (se aplicável)
- [ ] Nenhuma fase pulada

**Evidência:** [Links para ANALISE.md, PLANO.md, EXECUCAO.md]

---

### R16: Regra de Ouro Martyn 🥇
- [ ] Ambiguidades identificadas e clarificadas
- [ ] Perguntas feitas antes de assumir
- [ ] Opções apresentadas para decisões
- [ ] Autorização obtida antes de prosseguir
- [ ] Sem inferências ou suposições

**Evidência:** [Perguntas e respostas documentadas]

---

### R17: Alterações UI/Layout Only 🎨
- [ ] Mudanças de UI isoladas de lógica
- [ ] Marcadores `LAYOUT_START/END` usados (se aplicável)
- [ ] Lógica não alterada (hooks, API calls, state)
- [ ] Props não renomeados (sem breaking changes)
- [ ] Componentes testados sem alteração de testes

**Evidência:** [Commits separados para UI vs lógica]

---

### R18: Modularização (Modelo Martyn) 🏗️
- [ ] Módulo segue estrutura padrão
  - [ ] `/service/` - Backend implementation
  - [ ] `/sdk-js/` - TypeScript SDK
  - [ ] `/sdk-py/` - Python SDK (se aplicável)
  - [ ] `/docs/` - Documentação completa
- [ ] Responsabilidade única e bem definida
- [ ] API clara (REST/GraphQL/gRPC)
- [ ] Testes > 80% coverage
- [ ] Health check implementado
- [ ] Observabilidade (logs, métricas, tracing)
- [ ] Dockerfile presente
- [ ] README completo
- [ ] CHANGELOG mantido

**Evidência:** [Link para checklist detalhado do módulo]

**Ver:** [[07-Receitas-e-Playbooks/02-Checklists/13-Checklist-R18-Modularizacao]]

---

### R19: Papéis de Agents (3 Arquétipos) 🎭
- [ ] **Architect:** Planejou mas não implementou código longo
- [ ] **Codex Dev:** Implementou seguindo plano (sem decisões próprias)
- [ ] **Executor:** Fez correções pequenas (< 50 linhas)
- [ ] Papéis respeitados conforme matriz de decisão
- [ ] Handoffs documentados entre agents
- [ ] Escalações apropriadas (quando necessário)

**Evidência:** [Commits e handoffs identificam agent responsável]

---

### R20: Evitar Ambiguidade ❓
- [ ] Todas as decisões listadas antes de codar
- [ ] Opções apresentadas para escolha
- [ ] Autorização aguardada antes de prosseguir
- [ ] 10 perguntas obrigatórias respondidas (Architect)
- [ ] Nenhuma suposição feita

**Evidência:** [Perguntas e decisões documentadas]

**Ver:** [[07-Receitas-e-Playbooks/02-Checklists/15-Checklist-R20-Evitar-Ambiguidade]]

---

### R21: Raciocínio Profundo ("Pensar Antes") 🧠
- [ ] Análise interna realizada antes de responder
- [ ] Recursos de reasoning gastos adequadamente
- [ ] Resposta revisada 3x antes de enviar
- [ ] Riscos detectados e tratados
- [ ] Edge cases considerados
- [ ] Validação contra regras globais realizada

**Evidência:** [Qualidade da documentação e decisões]

---

## Score de Compliance

### Cálculo:
**Total de itens aplicáveis:** [X]
**Itens validados (✅):** [Y]
**Score:** [Y/X * 100]%

### Requisito:
✅ **Score mínimo:** 95%
⚠️ **Score 90-94%:** Requer justificativa
❌ **Score < 90%:** Bloqueia merge

---

## Gaps Identificados

### Gap 1: [Descrição]
**Severidade:** Alta/Média/Baixa
**Regra violada:** R[X]
**Ação corretiva:** [O que fazer]
**Responsável:** [Quem]
**Prazo:** [Quando]

---

### Gap 2: [Descrição]
**Severidade:** Alta/Média/Baixa
**Regra violada:** R[X]
**Ação corretiva:** [O que fazer]
**Responsável:** [Quem]
**Prazo:** [Quando]

---

## Aprovação Final

**Checklist completo por:**
- [ ] Desenvolvedor
- [ ] Architect (se aplicável)
- [ ] Tech Lead
- [ ] Security (se mudanças de segurança)

**Assinaturas:**
- **Desenvolvedor:** [Nome] - [Data]
- **Reviewer:** [Nome] - [Data]

**Status:** ✅ Aprovado / ⚠️ Com ressalvas / ❌ Reprovado

---

## Anexos

### Evidências:
- [Link para testes]
- [Link para docs]
- [Link para code review]
- [Screenshots (se UI)]

### Relatórios:
- [Relatório de licenças]
- [Relatório de coverage]
- [Relatório de build]

---

> [!success] Compliance Validado
> Este checklist garante que todas as 21 regras OBM foram validadas.

**Versão do Checklist:** 1.0
**Data de Validação:** [YYYY-MM-DD]
**Projeto/Módulo:** [Nome]
**Task/Issue:** [ID]

---

## Referências

- [[00-Config/03-RULES-GLOBAL]] - Definição completa das 21 regras
- [[00-Config/ARCHITECTURE-CONSOLIDACAO-EXPANDIDA]] - Arquitetura consolidada
- [[07-Receitas-e-Playbooks/02-Checklists/]] - Checklists detalhados por regra
- [[PLAN-TAREFAS-EXPANDIDO]] - Plano de implementação
