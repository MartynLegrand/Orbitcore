# Exemplos Práticos - 21 Regras OBM 💡

> **Versão:** 1.0
> **Data:** 2025-11-16
> **Baseado em:** [[00-Config/03-RULES-GLOBAL]]

## Visão Geral

Este diretório contém **exemplos práticos** de aplicação de cada uma das 21 regras globais do ecossistema OBM. Cada exemplo mostra cenários reais de uso (✅ correto e ❌ incorreto).

## Objetivo

- **Aprender por exemplo:** Ver regras em ação
- **Evitar erros comuns:** Ver o que não fazer
- **Acelerar desenvolvimento:** Templates prontos
- **Validar implementação:** Comparar com exemplos

---

## Estrutura dos Exemplos

Cada exemplo contém:
1. **Contexto:** Cenário real
2. **Regra aplicável:** Qual regra está sendo demonstrada
3. **❌ Errado:** Como NÃO fazer
4. **✅ Correto:** Como fazer corretamente
5. **Explicação:** Por que a diferença importa
6. **Checklist de validação:** Como validar sua implementação

---

## Exemplos Disponíveis

| ID | Regra | Arquivo | Status |
|----|-------|---------|--------|
| 1 | Nomenclatura e Placeholders | 01-Exemplo-R01-Nomenclatura.md | 📝 TODO |
| 2 | Contratos e Integração | 02-Exemplo-R02-Contratos.md | 📝 TODO |
| 3 | Segurança | 03-Exemplo-R03-Seguranca.md | 📝 TODO |
| ... | ... | ... | ... |
| 13 | Open-Source Ético | 13-Exemplo-R13-Open-Source.md | 📝 TODO |
| 14 | IA Não Reescreve | 14-Exemplo-R14-IA-Minimo.md | 📝 TODO |
| 15 | Protocolo .TASK | 15-Exemplo-R15-Protocolo-Task.md | 📝 TODO |
| 16 | Regra de Ouro | 16-Exemplo-R16-Regra-Ouro.md | 📝 TODO |
| 17 | UI/Layout Only | 17-Exemplo-R17-UI-Layout.md | 📝 TODO |
| 18 | Modularização | 18-Exemplo-R18-Modularizacao.md | 📝 TODO |
| 19 | Papéis de Agents | 19-Exemplo-R19-Agents.md | 📝 TODO |
| 20 | Evitar Ambiguidade | 20-Exemplo-R20-Ambiguidade.md | 📝 TODO |
| 21 | Raciocínio Profundo | 21-Exemplo-R21-Raciocinio.md | 📝 TODO |

---

## Como Usar os Exemplos

### 1. Identificar Regra Relevante
Você está:
- Criando novo módulo? → Ver R18 (Modularização)
- Adicionando dependência? → Ver R13 (Open-Source)
- Fazendo code review? → Ver R14 (IA Não Reescreve)
- Fazendo alteração de UI? → Ver R17 (UI/Layout)
- Começando nova task? → Ver R15 (Protocolo .TASK)

### 2. Ler Exemplo Completo
- Entenda o contexto
- Veja o exemplo errado (❌)
- Veja o exemplo correto (✅)
- Leia a explicação

### 3. Aplicar no Seu Código
- Use exemplo correto como template
- Adapte para seu caso
- Valide com checklist do exemplo

### 4. Validar
- Compare sua implementação com exemplo
- Use checklist de validação
- Passe no code review

---

## Categorias de Exemplos

### Fundação (R1-R12)
Exemplos de regras originais:
- Nomenclatura consistente
- Contratos claros
- Segurança
- Linkagem de documentação
- Stack fixa

### Processo (R13-R15, R19-R21)
Exemplos de workflow:
- Uso ético de código OS
- Alterações mínimas (IA)
- Protocolo de 3 fases
- Papéis de agents
- Raciocínio profundo

### Arquitetura (R18)
Exemplos de estrutura:
- Módulos completos
- APIs claras
- SDKs funcionais
- Documentação completa

### UI/UX (R17)
Exemplos de separação:
- Layout vs lógica
- Componentes puros
- Marcadores apropriados

### Comunicação (R16, R20)
Exemplos de clarificação:
- Perguntas corretas
- Identificação de ambiguidade
- Obtenção de aprovação

---

## Template de Exemplo

```markdown
# Exemplo: R[X] - [Nome da Regra]

> **Regra:** [X]
> **Categoria:** [Categoria]
> **Cenário:** [Descrição do cenário]

## Contexto

[Descrição da situação real]

## Regra Aplicável

[[00-Config/03-RULES-GLOBAL#X]]

[Resumo da regra]

## ❌ Exemplo ERRADO

[Código/configuração/processo incorreto]

### Por que está errado:
1. [Motivo 1]
2. [Motivo 2]

### Consequências:
- [Problema que pode causar]

## ✅ Exemplo CORRETO

[Código/configuração/processo correto]

### Por que está correto:
1. [Motivo 1]
2. [Motivo 2]

### Benefícios:
- [Vantagem 1]
- [Vantagem 2]

## Comparação

| Aspecto | Errado | Correto |
|---------|--------|---------|
| [Aspecto 1] | [Valor] | [Valor] |
| [Aspecto 2] | [Valor] | [Valor] |

## Checklist de Validação

- [ ] [Item de validação 1]
- [ ] [Item de validação 2]
- [ ] [Item de validação 3]

## Referências

- [[00-Config/03-RULES-GLOBAL#X]]
- [[07-Receitas-e-Playbooks/02-Checklists/...]]
- [Link externo se aplicável]
```

---

## Contribuindo com Exemplos

### Criar Novo Exemplo:
1. Use template acima
2. Crie cenário realístico
3. Mostre código real (não pseudocódigo)
4. Explique claramente a diferença
5. Adicione checklist de validação

### Qualidade dos Exemplos:
- **Realístico:** Baseado em situações reais
- **Completo:** Código funcional, não fragmentos
- **Claro:** Fácil de entender
- **Prático:** Pode ser copiado e adaptado
- **Validável:** Inclui checklist

---

## Roadmap

### Prioridade Alta (TIER 0):
- [ ] R13: Open-Source Ético
- [ ] R14: IA Não Reescreve
- [ ] R15: Protocolo .TASK
- [ ] R18: Modularização

### Prioridade Média:
- [ ] R16: Regra de Ouro
- [ ] R17: UI/Layout Only
- [ ] R19: Papéis de Agents
- [ ] R20: Evitar Ambiguidade
- [ ] R21: Raciocínio Profundo

### Prioridade Baixa:
- [ ] R1-R12: Regras originais

---

## Uso em Treinamento

### Onboarding:
1. Novos membros leem exemplos das regras críticas (R13-R21)
2. Fazem exercícios baseados em exemplos
3. Submetem código para review usando checklists

### Workshops:
1. Apresentar regra
2. Mostrar exemplo errado (discussão)
3. Mostrar exemplo correto
4. Exercício prático

### Code Review Training:
1. Usar exemplos errados como casos de estudo
2. Identificar violações
3. Propor correções
4. Validar contra checklists

---

## Suporte

### Dúvidas sobre Exemplos:
- Consulte a regra original em [[00-Config/03-RULES-GLOBAL]]
- Veja checklist correspondente em [[07-Receitas-e-Playbooks/02-Checklists/]]
- Pergunte no chat/Slack do time

### Sugerir Novos Exemplos:
- Abra issue com tag `example`, `documentation`
- Descreva o cenário
- Explique por que seria útil

---

## Changelog

### v1.0 (2025-11-16)
- ✅ README com estrutura
- ✅ Template de exemplo
- 📝 21 exemplos planejados

### Próximas Versões:
- [ ] Exemplos R13-R21 (prioritários)
- [ ] Exemplos R1-R12
- [ ] Exemplos de integração entre regras

---

## Referências

- [[00-Config/03-RULES-GLOBAL]] - 21 regras completas
- [[07-Receitas-e-Playbooks/02-Checklists/]] - Checklists de validação
- [[07-Receitas-e-Playbooks/01-Templates/]] - Templates de tasks
- [[00-Config/ARCHITECTURE-CONSOLIDACAO-EXPANDIDA]] - Arquitetura consolidada

---

> [!tip] Dica
> Ao encontrar situação não coberta por exemplos existentes, documente! Pode virar um novo exemplo útil para todos.

**Versão:** 1.0
**Última Atualização:** 2025-11-16
**Mantido por:** Architect Team
