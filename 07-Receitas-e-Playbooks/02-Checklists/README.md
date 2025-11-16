# Checklists de Validação - 21 Regras OBM ✅

> **Versão:** 1.0
> **Data:** 2025-11-16
> **Baseado em:** [[00-Config/03-RULES-GLOBAL]]

## Visão Geral

Este diretório contém **checklists detalhados** para validar compliance com cada uma das 21 regras globais do ecossistema OBM.

## Estrutura

### Master Checklist
**Arquivo:** `00-Master-Checklist.md`
**Uso:** Validação rápida de todas as 21 regras em um único documento

**Quando usar:**
- Code review
- Antes de merge
- Auditoria completa de módulo
- Validação de task/PR

---

### Checklists Detalhados

| ID | Regra | Arquivo | Status |
|----|-------|---------|--------|
| 1-12 | Regras Originais | 00-Master-Checklist.md | ✅ Completo |
| 13 | Open-Source Ético | 08-Checklist-R13-Open-Source-Etico.md | ✅ Completo |
| 14 | IA Não Reescreve | [Pendente] | 📝 TODO |
| 15 | Protocolo .TASK | [Pendente] | 📝 TODO |
| 16 | Regra de Ouro | [Pendente] | 📝 TODO |
| 17 | UI/Layout Only | [Pendente] | 📝 TODO |
| 18 | Modularização | 13-Checklist-R18-Modularizacao.md | ✅ Completo |
| 19 | Papéis de Agents | [Pendente] | 📝 TODO |
| 20 | Evitar Ambiguidade | [Pendente] | 📝 TODO |
| 21 | Raciocínio Profundo | [Pendente] | 📝 TODO |

---

## Checklists Disponíveis

### 1. Master Checklist (Todas as Regras)
**Arquivo:** `00-Master-Checklist.md`

**Conteúdo:**
- Validação rápida das 21 regras
- Score de compliance calculado
- Gaps identificados
- Seção de aprovação

**Uso típico:**
```markdown
# Durante code review
1. Abrir 00-Master-Checklist.md
2. Marcar cada item aplicável
3. Calcular score
4. Documentar gaps
5. Aprovar ou solicitar mudanças
```

---

### 2. R13: Open-Source Ético
**Arquivo:** `08-Checklist-R13-Open-Source-Etico.md`

**Contém:**
- Verificação de licenças (40+ items)
- Atribuição e créditos
- Uso ético
- Contribuições de volta
- Documentação de licenças
- CI/CD checks
- Casos especiais
- Auditoria periódica

**Quando usar:**
- Ao adicionar nova dependência
- Antes de cada release
- Auditoria legal
- Compliance check

**Ferramentas:**
```bash
# Node.js
npx license-checker --summary

# Python
pip-licenses --format=markdown

# Go
go-licenses report ./...
```

---

### 3. R18: Modularização
**Arquivo:** `13-Checklist-R18-Modularizacao.md`

**Contém:**
- Estrutura de arquivos (39+ items)
- Responsabilidade única
- API clara
- SDKs disponíveis
- Testes (coverage > 80%)
- Observabilidade
- Deploy e infraestrutura
- Documentação completa
- Segurança
- Performance

**Quando usar:**
- Criar novo módulo
- Validar módulo existente
- Refatoração de módulo
- Code review de módulo

**Validação rápida:**
```bash
#!/bin/bash
MODULE=$1
test -d "$MODULE/service" && echo "✅ service/"
test -d "$MODULE/sdk-js" && echo "✅ sdk-js/"
test -d "$MODULE/docs" && echo "✅ docs/"
test -f "$MODULE/README.md" && echo "✅ README.md"
```

---

## Como Usar os Checklists

### Passo 1: Escolher Checklist Apropriado
- **Validação completa:** `00-Master-Checklist.md`
- **Regra específica:** Checklist detalhado da regra

### Passo 2: Copiar para Sua Task
```bash
cp 07-Receitas-e-Playbooks/02-Checklists/00-Master-Checklist.md \
   docs/tasks/TASK-123-COMPLIANCE.md
```

### Passo 3: Validar Item por Item
- Marque `[x]` para items conformes
- Marque `[ ]` para items não conformes
- Documente evidências
- Anote "N/A" se não aplicável

### Passo 4: Calcular Score
```
Score = (Items validados / Items aplicáveis) * 100
```

### Passo 5: Ações Corretivas
- Se score < 95%, identificar gaps
- Documentar ações corretivas
- Definir responsáveis e prazos

### Passo 6: Aprovar
- Obter aprovações necessárias
- Documentar no checklist
- Arquivar para auditoria futura

---

## Níveis de Compliance

### 🏆 Excelente (95-100%)
- Todos ou quase todos os items validados
- Nenhum gap crítico
- Aprovado sem ressalvas

### ✅ Bom (85-94%)
- Maioria dos items validados
- Gaps menores identificados
- Aprovado com ressalvas

### ⚠️ Aceitável (75-84%)
- Items essenciais validados
- Gaps moderados identificados
- Requer plano de ação

### ❌ Insuficiente (<75%)
- Muitos items não validados
- Gaps críticos identificados
- Bloqueado até correção

---

## Frequência de Uso

### Por Task/PR (Sempre):
- [ ] Master Checklist (validação básica)
- [ ] Checklists de regras relevantes à mudança

### Por Sprint (Recomendado):
- [ ] Auditoria de compliance geral
- [ ] Revisão de gaps acumulados

### Por Release (Obrigatório):
- [ ] Master Checklist completo
- [ ] R13 (Licenças) auditoria completa
- [ ] R18 (Modularização) para módulos novos/modificados

### Por Trimestre (Obrigatório):
- [ ] Auditoria completa de todos os módulos
- [ ] Atualização de checklists se necessário
- [ ] Relatório de compliance para stakeholders

---

## Integração com Ferramentas

### GitHub Actions
```yaml
name: Compliance Check

on: [pull_request]

jobs:
  compliance:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      # Check licenses (R13)
      - name: License Check
        run: npx license-checker --onlyAllow 'MIT;Apache-2.0;BSD-2-Clause;BSD-3-Clause;ISC'
      
      # Check test coverage (R18)
      - name: Test Coverage
        run: npm test -- --coverage --coverageThreshold='{"global":{"statements":80}}'
      
      # Check structure (R18)
      - name: Module Structure
        run: ./scripts/validate-module-structure.sh
```

---

### Pre-commit Hook
```bash
#!/bin/bash
# .git/hooks/pre-commit

echo "Running compliance checks..."

# Check if adding new dependencies
if git diff --cached --name-only | grep -q "package.json"; then
  echo "Checking licenses..."
  npx license-checker --onlyAllow 'MIT;Apache-2.0;BSD-2-Clause;BSD-3-Clause;ISC' || exit 1
fi

# Check test coverage
npm test -- --coverage --silent || exit 1

echo "✅ Compliance checks passed"
```

---

### VS Code Task
```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Compliance Check",
      "type": "shell",
      "command": "bash",
      "args": ["./scripts/check-compliance.sh"],
      "problemMatcher": [],
      "presentation": {
        "reveal": "always",
        "panel": "new"
      }
    }
  ]
}
```

---

## Boas Práticas

### DO ✅
- **Use checklists em code reviews** - Garante consistência
- **Documente evidências** - Facilita auditoria
- **Calcule score** - Métrica objetiva de qualidade
- **Atualize regularmente** - Checklists evoluem com o projeto
- **Compartilhe resultados** - Transparência no compliance

### DON'T ❌
- **Não pule checklists** - Podem pegar problemas críticos
- **Não marque sem validar** - Honestidade é essencial
- **Não ignore gaps** - Documente e corrija
- **Não use checklists desatualizados** - Sempre use versão mais recente

---

## Criando Novos Checklists

### Template:
```markdown
# Checklist: R[X] - [Nome da Regra]

> **Regra:** [X]
> **Categoria:** [Categoria]
> **Prioridade:** [CRÍTICA/ALTA/MÉDIA/BAIXA]
> **Baseado em:** [[00-Config/03-RULES-GLOBAL#X]]

## Visão Geral da Regra
[Descrição da regra]

## Checklist Detalhado

### Seção 1
- [ ] Item 1
- [ ] Item 2

### Seção 2
- [ ] Item 3
- [ ] Item 4

## Score de Compliance
[Como calcular]

## Exemplos
[Exemplos práticos]

## Ferramentas
[Ferramentas para validação]

## Referências
[Links relacionados]
```

---

## Contribuindo

### Melhorias nos Checklists:
1. Identifique gap ou melhoria
2. Crie issue ou PR
3. Discuta com time
4. Atualize checklist
5. Atualize versão

### Novos Checklists:
1. Use template acima
2. Documente pelo menos 10 items
3. Inclua exemplos práticos
4. Adicione ferramentas de validação
5. Submeta para review

---

## Roadmap

### Em Andamento:
- [x] Master Checklist
- [x] R13: Open-Source Ético
- [x] R18: Modularização

### Próximos (TIER 0):
- [ ] R14: IA Não Reescreve
- [ ] R15: Protocolo .TASK
- [ ] R16: Regra de Ouro
- [ ] R17: UI/Layout Only
- [ ] R19: Papéis de Agents
- [ ] R20: Evitar Ambiguidade
- [ ] R21: Raciocínio Profundo

### Futuro:
- [ ] Checklists para regras 1-12
- [ ] Ferramenta CLI de validação
- [ ] Dashboard de compliance
- [ ] Relatórios automatizados

---

## Suporte

### Problemas:
- Abra issue no repositório
- Tag: `checklist`, `compliance`
- Descreva o problema ou dúvida

### Dúvidas:
- Consulte [[00-Config/03-RULES-GLOBAL]]
- Veja exemplos em [[03-Modulos-OBM]]
- Pergunte no chat/Slack do time

---

## Changelog

### v1.0 (2025-11-16)
- ✅ Master Checklist (21 regras)
- ✅ R13: Open-Source Ético (detalhado)
- ✅ R18: Modularização (detalhado)
- ✅ README com instruções

### Próximas Versões:
- [ ] Checklists restantes (R14-R21)
- [ ] Automação de validação
- [ ] Integração com CI/CD

---

## Referências

- [[00-Config/03-RULES-GLOBAL]] - 21 regras completas
- [[00-Config/ARCHITECTURE-CONSOLIDACAO-EXPANDIDA]] - Arquitetura consolidada
- [[07-Receitas-e-Playbooks/01-Templates/]] - Templates de tasks
- [[PLAN-TAREFAS-EXPANDIDO]] - Plano de implementação

---

> [!tip] Dica
> Comece sempre com o Master Checklist para ter visão geral, depois aprofunde com checklists específicos.

**Versão:** 1.0
**Última Atualização:** 2025-11-16
**Mantido por:** Architect Team
