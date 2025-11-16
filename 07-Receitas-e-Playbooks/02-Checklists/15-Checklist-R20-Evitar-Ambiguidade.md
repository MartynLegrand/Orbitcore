# Checklist: R20 - Evitar Ambiguidade

**Regra:** "Nunca assuma. Sempre pergunte." Liste TODAS as decisões antes de codar. Dê opções e espere autorização.

**Versão:** 1.0  
**Última atualização:** 2025-11-16

---

## 📋 Checklist Completo

### 1. 10 Perguntas Obrigatórias (Architect)

Antes de qualquer planejamento, o Architect DEVE responder:

#### 1.1 Escopo e Requisitos
- [ ] **P1: O que EXATAMENTE deve ser feito?**
  - Funcionalidade completa ou MVP?
  - Quais features estão incluídas?
  - O que está explicitamente FORA do escopo?

- [ ] **P2: Quem são os usuários finais?**
  - Desenvolvedores? Usuários finais? Admin?
  - Nível técnico? (Expert vs. Iniciante)
  - Volume esperado? (10 users vs. 10M users)

#### 1.2 Requisitos Técnicos
- [ ] **P3: Qual stack tecnológica usar?**
  - Backend: NestJS? FastAPI? Express?
  - Frontend: React? Vue? Next.js?
  - Banco: PostgreSQL? MongoDB? Redis?
  - Por que esta escolha? (documentar)

- [ ] **P4: Quais são os requisitos não-funcionais?**
  - Performance: < 200ms? < 1s?
  - Disponibilidade: 99.9%? 99.99%?
  - Escalabilidade: 100 users? 1M users?
  - Segurança: dados sensíveis? compliance?

#### 1.3 Integrações e Dependências
- [ ] **P5: Há integrações com sistemas externos?**
  - Quais APIs consumir?
  - Qual versão das APIs?
  - Autenticação necessária?
  - SLA dos sistemas externos?

- [ ] **P6: Quais dependências/bibliotecas usar?**
  - Licenças verificadas? (R13)
  - Versões específicas?
  - Alternativas consideradas?

#### 1.4 Dados e Contratos
- [ ] **P7: Qual o modelo de dados?**
  - Campos obrigatórios vs. opcionais?
  - Tipos de dados esperados?
  - Validações necessárias?
  - Migração de dados existentes?

- [ ] **P8: Quais os contratos de API?**
  - Request/Response formats?
  - Códigos de erro? (400, 404, 500?)
  - Versionamento da API? (v1, v2?)
  - Retro-compatibilidade necessária?

#### 1.5 Qualidade e Entrega
- [ ] **P9: Quais os critérios de aceitação?**
  - Como validar se está correto?
  - Quais cenários testar?
  - Métricas de sucesso?
  - Cobertura de testes mínima?

- [ ] **P10: Qual o prazo e prioridade?**
  - Deadline real? (não "ideal")
  - O que é P0 (crítico) vs. P1 (nice-to-have)?
  - Há trade-offs aceitáveis?
  - Posso entregar em fases?

---

### 2. Checklist de Perguntas por Fase

#### 2.1 FASE 1: ANÁLISE

**Perguntas Obrigatórias:**
- [ ] Li o requisito 3x e ainda entendo da mesma forma?
- [ ] Há termos vagos que precisam clarificação?
- [ ] Tenho certeza de quais arquivos modificar?
- [ ] Sei qual comportamento esperado em cada cenário?
- [ ] Identifiquei todos os edge cases?
- [ ] Há decisões técnicas pendentes?
- [ ] Tenho todas as informações para prosseguir?

**Se QUALQUER resposta for "não" → PAUSAR e perguntar**

---

#### 2.2 FASE 2: PLANO

**Perguntas Obrigatórias:**
- [ ] Apresentei mínimo 2 opções alternativas?
- [ ] Documentei prós/contras de cada opção?
- [ ] Recomendei uma opção com justificativa?
- [ ] Há trade-offs que o stakeholder deve escolher?
- [ ] Todas as decisões técnicas estão documentadas?
- [ ] Especificação não tem ambiguidades?
- [ ] Obtive aprovação explícita do plano?

**Se QUALQUER resposta for "não" → Completar antes de FASE 3**

---

#### 2.3 FASE 3: EXECUÇÃO

**Perguntas Obrigatórias:**
- [ ] Estou seguindo o plano aprovado?
- [ ] Não estou fazendo "melhorias" não aprovadas?
- [ ] Identifiquei desvio do plano? (se sim, pausar)
- [ ] Todos os testes estão passando?
- [ ] Implementação atende critérios de aceitação?
- [ ] Não introduzi breaking changes sem aprovação?
- [ ] Documentei tudo que implementei?

**Se houver desvio → PAUSAR, documentar, pedir aprovação**

---

### 3. Templates de Clarificação

#### 3.1 Template: Requisito Ambíguo

```markdown
## 🔍 Requisito Necessita Clarificação

**Requisito Original:**
> [Copiar texto exato do requisito]

**Ambiguidade Identificada:**
[Explicar o que não está claro]

**Interpretações Possíveis:**

### Interpretação A:
[Como eu entendo versão A]

**Exemplo:**
[Exemplo concreto da interpretação A]

### Interpretação B:
[Como eu entendo versão B]

**Exemplo:**
[Exemplo concreto da interpretação B]

**Pergunta:**
Qual interpretação é a correta? Ou há uma terceira opção?

**Bloqueador:** Não posso prosseguir sem clarificação ⛔
```

---

#### 3.2 Template: Decisão Técnica

```markdown
## ⚙️ Decisão Técnica Necessária

**Contexto:**
[Descrever o problema/situação]

**Opções Identificadas:**

### Opção A: [Nome]
**Descrição:** [Como funciona]
**Prós:**
- ✅ [Vantagem 1]
- ✅ [Vantagem 2]

**Contras:**
- ❌ [Desvantagem 1]
- ❌ [Desvantagem 2]

**Esforço:** [X horas]
**Risco:** [Baixo/Médio/Alto]

### Opção B: [Nome]
[Mesma estrutura]

### Opção C: [Nome]
[Mesma estrutura]

**Recomendação:** Opção [X]
**Justificativa:** [Por que esta opção é melhor]

**Pergunta:**
Qual opção devemos seguir? Ou há outra preferência?
```

---

#### 3.3 Template: Trade-off

```markdown
## ⚖️ Trade-off Identificado

**Situação:**
Não é possível ter [X] E [Y] simultaneamente.

**Trade-off:**

| Aspecto | Opção A (Priorizar X) | Opção B (Priorizar Y) |
|---------|----------------------|----------------------|
| Performance | ⚡ Rápido (< 100ms) | 🐌 Lento (< 1s) |
| Simplicidade | ❌ Complexo | ✅ Simples |
| Manutenção | ⚠️ Difícil | ✅ Fácil |
| Esforço | 📅 8h | 📅 2h |

**Pergunta:**
Qual aspecto é mais importante: [X] ou [Y]?

**Impacto da Decisão:**
- Se escolher X: [consequências]
- Se escolher Y: [consequências]
```

---

### 4. Sinais de Ambiguidade

#### 4.1 Red Flags (⚠️ PAUSAR)

**Linguagem Vaga:**
- [ ] "Melhorar", "Otimizar", "Ajustar" (sem métrica)
- [ ] "Rápido", "Lento", "Grande", "Pequeno" (relativo)
- [ ] "Alguns", "Vários", "Geralmente" (impreciso)
- [ ] "Pode ser", "Talvez", "Provavelmente" (incerto)

**Especificações Incompletas:**
- [ ] "Adicionar autenticação" (qual método? OAuth? JWT?)
- [ ] "Validar email" (regex simples? RFC completo?)
- [ ] "Salvar no banco" (qual tabela? quais campos?)

**Contexto Implícito:**
- [ ] "Seguir o padrão" (qual padrão exatamente?)
- [ ] "Como no módulo X" (quais aspectos copiar?)
- [ ] "Fazer igual ao anterior" (qual anterior?)

**Decisões Pendentes:**
- [ ] "Usar biblioteca Y" (qual versão?)
- [ ] "Integrar com API Z" (qual endpoint? qual auth?)
- [ ] "Deploy no ambiente W" (staging? prod?)

---

### 5. Processo de Validação

#### 5.1 Auto-Validação (Antes de Codar)

**Checklist:**
- [ ] Consigo explicar a tarefa para alguém sem contexto?
- [ ] Posso listar TODAS as decisões tomadas?
- [ ] Cada decisão tem justificativa documentada?
- [ ] Não usei frases tipo "Eu acho", "Provavelmente"?
- [ ] Tenho 100% de certeza de cada passo?

**Teste Prático:**
Escreva 1 parágrafo explicando a implementação.
Se usar palavras ambíguas → PAUSAR e clarificar.

---

#### 5.2 Peer Review de Decisões

**Antes de Implementar:**
Apresente suas decisões para outro dev (ou simule):

```markdown
## Revisão de Decisões

| Decisão | Fonte | Certeza | Status |
|---------|-------|---------|--------|
| Usar PostgreSQL | README linha 45 | 100% | ✅ OK |
| Port 3000 | Assumido | 60% | ❌ CONFIRMAR |
| Timeout 30s | Inferido | 70% | ❌ CONFIRMAR |
| Usar bcrypt | ADR 005 | 100% | ✅ OK |

**Regra:** Certeza < 90% = Perguntar antes
```

---

### 6. Exemplos Práticos

#### ✅ EXEMPLO BOM: Identificação Proativa

**Requisito:**
> "Adicionar busca de produtos"

**Análise (Architect):**
```markdown
## Ambiguidades Identificadas

1. **Tipo de busca:**
   - Busca simples por nome?
   - Busca avançada (nome + categoria + preço)?
   - Full-text search?

2. **Performance:**
   - Quantos produtos no banco? (100? 1M?)
   - Resposta esperada: < 100ms? < 1s?

3. **UI:**
   - Autocomplete?
   - Filtros?
   - Paginação?

## Opções Propostas

### Opção A: Busca Simples (LIKE)
- Busca por nome apenas
- SQL LIKE '%termo%'
- Funciona até 10k produtos
- Esforço: 2h

### Opção B: ElasticSearch
- Full-text search
- Escalável (milhões)
- Autocomplete integrado
- Esforço: 12h + infra

## Perguntas
1. Quantos produtos teremos?
2. Precisa de autocomplete?
3. Busca só por nome ou mais campos?
```

**Resultado:** Cliente respondeu, escolheu Opção A ✅

---

#### ❌ EXEMPLO RUIM: Assumir e Implementar

**Requisito:**
> "Adicionar busca de produtos"

**Implementação (ERRADA):**
```typescript
// Desenvolvedor assumiu:
// - ElasticSearch (não confirmado)
// - Full-text search (não pedido)
// - Autocomplete (não especificado)
// - Busca em múltiplos campos (não claro)

// [Gastou 12h implementando solução complexa]

// Cliente:
// "Eu só queria busca simples por nome... 😞"
```

**Problema:**
- 10h de trabalho desperdiçado
- Solução over-engineered
- Cliente insatisfeito
- Retrabalho total

---

### 7. Integração com Protocolo .TASK

#### 7.1 Checkpoint FASE 1
- [ ] Todas as 10 perguntas obrigatórias respondidas?
- [ ] Zero ambiguidades identificadas?
- [ ] Todas as incertezas clarificadas?

#### 7.2 Checkpoint FASE 2
- [ ] Todas as decisões documentadas com justificativa?
- [ ] Opções apresentadas ao stakeholder?
- [ ] Escolha final explicitamente aprovada?

#### 7.3 Checkpoint FASE 3
- [ ] Implementação segue decisões aprovadas?
- [ ] Zero "ajustes" não aprovados?
- [ ] Desvios documentados e re-aprovados?

---

### 8. Score de Compliance

#### Cálculo do Score

**Pontuação:**
- 10 perguntas obrigatórias respondidas (40 pontos)
- Ambiguidades identificadas proativamente (25 pontos)
- Opções apresentadas (20 pontos)
- Decisões documentadas (10 pontos)
- Aprovação explícita obtida (5 pontos)

**Total:** 100 pontos

#### Checklist Rápido

| Item | Pontos | ✅ |
|------|--------|---|
| 10 perguntas respondidas | 40 | ☐ |
| Ambiguidades identificadas | 25 | ☐ |
| Opções apresentadas (≥2) | 20 | ☐ |
| Decisões documentadas | 10 | ☐ |
| Aprovação explícita | 5 | ☐ |
| **TOTAL** | **100** | |

### Níveis
- 🏆 **Excellent:** 95-100 pontos (zero ambiguidade)
- ✅ **Good:** 85-94 pontos (ambiguidade mínima)
- ⚠️ **Acceptable:** 75-84 pontos (algumas suposições)
- ❌ **Insufficient:** < 75 pontos (muitas suposições)

---

## 📚 Referências

- [[03-RULES-GLOBAL#R20]]
- [[03-RULES-GLOBAL#R16]] (complementar - Regra de Ouro)
- [[04-Protocolo-Tasks]]
- [[01-Template-Analise#Perguntas-de-Clarificacao]]
