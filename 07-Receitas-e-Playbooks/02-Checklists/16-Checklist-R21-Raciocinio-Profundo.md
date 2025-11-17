# Checklist: R21 - Raciocínio Profundo ("Pensar Antes")

**Regra:** Liste pensamentos internamente ANTES de responder. Gaste recursos de reasoning (mais tokens = menos erros). Revise 3x antes de gerar resposta. Se detectar risco, PARE e PERGUNTE.

**Versão:** 1.0  
**Última atualização:** 2025-11-16

---

## 📋 Checklist Completo

### 1. Processo de Pensamento Profundo

#### 1.1 ANTES de Qualquer Ação

**Checklist Obrigatório:**
- [ ] **Pausar:** Não responder imediatamente
- [ ] **Ler:** Ler requisito 3x completamente
- [ ] **Pensar:** Listar pensamentos internos
- [ ] **Analisar:** Identificar riscos e edge cases
- [ ] **Validar:** Revisar conclusões 3x
- [ ] **Decidir:** Responder OU perguntar

**Tempo Mínimo de Pensamento:**
- Tarefa simples: 30-60 segundos
- Tarefa média: 2-5 minutos
- Tarefa complexa: 5-15 minutos

**Regra de Ouro:**
> "Thinking time < 10% do tempo total = Red flag"

---

#### 1.2 Estrutura de Pensamento Interno

**Template Interno (não mostrar ao usuário):**

```markdown
## 🧠 Pensamento Interno

### 1. Entendimento Inicial
- O que o usuário está pedindo?
- Qual o contexto?
- Há informação implícita?

### 2. Identificação de Riscos
- Quais os riscos técnicos?
- Quais os edge cases?
- O que pode dar errado?

### 3. Análise de Opções
- Quais são as alternativas?
- Prós e contras de cada?
- Qual a melhor abordagem?

### 4. Validação de Decisão
- Minha decisão está correta?
- Há ambiguidades não resolvidas?
- Preciso perguntar algo?

### 5. Verificação de Qualidade
- A resposta é clara?
- A resposta é completa?
- A resposta é acionável?
```

---

### 2. Checklist de Raciocínio por Complexidade

#### 2.1 Tarefa Simples (< 30min)

**Checklist Rápido:**
- [ ] Li o requisito 2x?
- [ ] Identifiquei mínimo 2 edge cases?
- [ ] Verifiquei se há ambiguidades?
- [ ] Considerei impacto em outros módulos?
- [ ] Revisei minha resposta 1x?

**Tempo de pensamento:** 30-60s

---

#### 2.2 Tarefa Média (30min - 4h)

**Checklist Expandido:**
- [ ] Li o requisito 3x?
- [ ] Listei todos os arquivos afetados?
- [ ] Identifiquei mínimo 5 edge cases?
- [ ] Verifiquei dependências externas?
- [ ] Considerei requisitos não-funcionais?
- [ ] Identifiquei possíveis bloqueadores?
- [ ] Apresentei mínimo 2 opções?
- [ ] Revisei minha resposta 2x?

**Tempo de pensamento:** 2-5min

---

#### 2.3 Tarefa Complexa (> 4h)

**Checklist Completo:**
- [ ] Li o requisito 5x?
- [ ] Criei lista completa de arquivos afetados?
- [ ] Identifiquei mínimo 10 edge cases?
- [ ] Mapeei todas as dependências?
- [ ] Analisei impacto em cada módulo?
- [ ] Considerei migração de dados?
- [ ] Identifiquei riscos de segurança?
- [ ] Verifiquei compliance com 21 regras?
- [ ] Apresentei mínimo 3 opções?
- [ ] Criei diagramas de arquitetura?
- [ ] Revisei minha resposta 3x?
- [ ] Pedi validação de outro agente?

**Tempo de pensamento:** 5-15min

---

### 3. Técnicas de Raciocínio Profundo

#### 3.1 First Principles Thinking

**Processo:**
1. Quebrar problema em componentes básicos
2. Questionar cada suposição
3. Reconstruir solução do zero

**Exemplo:**
```markdown
Problema: "Adicionar cache"

First Principles:
- Por que precisamos de cache?
  → Reduzir latência
  
- O que causa latência?
  → Queries lentas ao banco
  
- Por que queries são lentas?
  → Falta de índices
  
- Solução alternativa:
  → Adicionar índices ANTES de cache
  → Pode resolver sem adicionar complexidade
```

---

#### 3.2 Pre-Mortem Analysis

**Processo:**
"Imaginar que a implementação falhou. Por quê?"

**Template:**
```markdown
## Pre-Mortem: [Feature Name]

Imaginando que implementamos e FALHOU em produção...

### Possíveis Causas do Fracasso:
1. Performance degradou porque [...]
2. Segurança foi comprometida porque [...]
3. Dados foram corrompidos porque [...]
4. Usuários não conseguem usar porque [...]
5. Integração quebrou porque [...]

### Mitigações:
Para cada causa:
- Como prevenir?
- Como detectar cedo?
- Como recuperar?
```

---

#### 3.3 Segundo Pensamento (Devil's Advocate)

**Processo:**
"Argumentar CONTRA minha própria solução"

**Template:**
```markdown
## Minha Solução:
[Descrever solução proposta]

## Devil's Advocate (contra-argumentos):

### Por que NÃO fazer assim:
1. [Contra-argumento 1]
2. [Contra-argumento 2]
3. [Contra-argumento 3]

### Alternativas melhores:
1. [Alternativa 1] porque [...]
2. [Alternativa 2] porque [...]

### Validação Final:
Minha solução original ainda é a melhor porque [...]
```

---

### 4. Checklist de Revisão (3x)

#### 4.1 Primeira Revisão: Correção

**Perguntas:**
- [ ] A resposta está CORRETA tecnicamente?
- [ ] Não há erros de lógica?
- [ ] Código (se houver) compila?
- [ ] Sintaxe está correta?

---

#### 4.2 Segunda Revisão: Completude

**Perguntas:**
- [ ] A resposta está COMPLETA?
- [ ] Respondi tudo que foi perguntado?
- [ ] Não faltam informações críticas?
- [ ] Edge cases foram cobertos?

---

#### 4.3 Terceira Revisão: Clareza

**Perguntas:**
- [ ] A resposta é CLARA?
- [ ] Usuário vai entender?
- [ ] Não há ambiguidades?
- [ ] Exemplos são suficientes?
- [ ] Estrutura está organizada?

---

### 5. Detecção de Riscos

#### 5.1 Checklist de Riscos

**Riscos Técnicos:**
- [ ] Performance degradada?
- [ ] Escalabilidade comprometida?
- [ ] Segurança vulnerável?
- [ ] Compatibilidade quebrada?
- [ ] Complexidade excessiva?

**Riscos de Negócio:**
- [ ] Usuários afetados negativamente?
- [ ] Custo alto demais?
- [ ] Prazo irrealista?
- [ ] Dependência de terceiros crítica?

**Riscos de Processo:**
- [ ] Falta de conhecimento técnico?
- [ ] Dependência de outros times?
- [ ] Bloqueadores externos?
- [ ] Necessidade de aprovações?

---

#### 5.2 Quando PAUSAR e PERGUNTAR

**Triggers (qualquer um = PAUSAR):**
- [ ] Confiança na solução < 90%
- [ ] Risco Alto identificado
- [ ] Múltiplas interpretações possíveis
- [ ] Impacto em dados sensíveis
- [ ] Breaking change potencial
- [ ] Segurança pode ser comprometida
- [ ] Não tenho expertise necessária
- [ ] Decisão de negócio necessária

**Ação:**
```markdown
## ⛔ PAUSAR - Risco Identificado

**Risco:** [Descrição]
**Probabilidade:** [Alta/Média/Baixa]
**Impacto:** [Alto/Médio/Baixo]

**Preciso de:**
- [ ] Clarificação do requisito
- [ ] Validação de decisão técnica
- [ ] Aprovação de stakeholder
- [ ] Expertise de especialista

**Não posso prosseguir até resolver este risco**
```

---

### 6. Alocação de Recursos (Tokens)

#### 6.1 Budget de Tokens

**Regra Geral:**
> "Mais tokens no pensamento = Menos erros na implementação"

**Alocação Recomendada:**

| Tarefa | Pensamento | Resposta | Total |
|--------|-----------|----------|-------|
| Simples | 20% | 80% | 100% |
| Média | 30% | 70% | 100% |
| Complexa | 40% | 60% | 100% |
| Crítica | 50% | 50% | 100% |

**Exemplo:**
- Tarefa complexa com 4000 tokens disponíveis:
  - Pensamento interno: 1600 tokens (40%)
  - Resposta estruturada: 2400 tokens (60%)

---

#### 6.2 Red Flags de Subpensamento

**Sintomas:**
- Resposta instantânea (< 5s para tarefa complexa)
- Resposta genérica (sem especificidades)
- Única opção apresentada (sem alternativas)
- Zero riscos identificados
- Exemplos simples demais

**Correção:**
```markdown
"Vou repensar esta resposta com mais cuidado..."

[Gasta 5-10min pensando profundamente]

[Apresenta resposta completa com múltiplas opções e riscos]
```

---

### 7. Exemplos Práticos

#### ✅ EXEMPLO BOM: Raciocínio Profundo

**Requisito:**
> "Adicionar autenticação OAuth2"

**Pensamento Interno (5min):**
```markdown
## 🧠 Análise Profunda

### 1. Entendimento
- OAuth2 com qual provider? (Google, GitHub, Auth0?)
- Flow: Authorization Code? Implicit? PKCE?
- Apenas login ou também permissões?

### 2. Riscos Identificados
- Segurança: CSRF, token leakage
- UX: redirect loops, error handling
- Performance: cada login = external API call
- Compliance: GDPR, dados do usuário

### 3. Arquitetura
- Passport.js (Node.js) vs. FastAPI OAuth
- Onde armazenar tokens? (Redis? PostgreSQL?)
- Refresh token? Access token TTL?
- Sessões do usuário?

### 4. Edge Cases
- Provider indisponível
- Token expirado durante uso
- Usuário revoga permissão
- Email não verificado no provider
- Conflito de email (já existe local)

### 5. Opções
A) OAuth only (simples, depende de provider)
B) OAuth + local (flexível, mais complexo)
C) OAuth + SSO (enterprise, alto custo)

### 6. Validação
- Preciso saber qual provider
- Preciso saber se é único método de auth
- Preciso saber requisitos de compliance
```

**Resposta ao Usuário:**
```markdown
## Perguntas de Clarificação

Para implementar OAuth2 adequadamente, preciso saber:

1. **Provider:** Google? GitHub? Auth0? Microsoft?
2. **Método único:** OAuth será o ÚNICO método de autenticação?
3. **Dados:** Quais dados do usuário precisamos (email, nome, avatar)?
4. **Compliance:** Há requisitos GDPR/LGPD?

## Opções Arquiteturais

### Opção A: OAuth Only
[Detalhes...]

### Opção B: OAuth + Local
[Detalhes...]

## Riscos Identificados
1. Segurança: CSRF, token storage
2. UX: Error handling, provider down
3. Compliance: GDPR consent

Aguardando respostas para prosseguir com plano detalhado.
```

**Resultado:** 5min de pensamento = resposta completa e sem retrabalho ✅

---

#### ❌ EXEMPLO RUIM: Resposta Rápida

**Requisito:**
> "Adicionar autenticação OAuth2"

**Pensamento Interno (10s):**
```markdown
OAuth2 = Passport.js
```

**Resposta ao Usuário (ERRADA):**
```markdown
Vou implementar OAuth2 com Passport.js e Google.

[Código de 200 linhas...]
```

**Problemas:**
- Não perguntou qual provider
- Assumiu Google (pode estar errado)
- Não considerou edge cases
- Não identificou riscos de segurança
- Não apresentou opções
- **Resultado:** 2h de retrabalho ❌

---

### 8. Métricas de Qualidade

#### 8.1 Indicadores de Bom Raciocínio

**Checklist:**
- [ ] Tempo de pensamento ≥ 10% do tempo total
- [ ] Mínimo 2 opções apresentadas
- [ ] Mínimo 3 riscos identificados
- [ ] Mínimo 5 edge cases considerados
- [ ] Revisão feita 3x
- [ ] Ambiguidades identificadas proativamente
- [ ] Perguntas feitas ANTES de implementar

---

#### 8.2 Comparação: Rápido vs. Profundo

| Aspecto | Pensamento Rápido | Pensamento Profundo |
|---------|-------------------|---------------------|
| Tempo inicial | 30s | 5-15min |
| Opções | 1 | 2-3 |
| Riscos | 0-1 | 3-5 |
| Edge cases | 0-2 | 5-10 |
| Retrabalho | 40% | 5% |
| Bugs em prod | 8 | 1 |
| Tempo total | 8h (com retrabalho) | 5h (sem retrabalho) |

**Conclusão:** Pensar mais = Trabalhar menos (paradoxo produtivo)

---

### 9. Integração com Outras Regras

#### 9.1 R15 (Protocolo .TASK)

**FASE 1 (Análise):**
- [ ] Gastar 30-50% do tempo pensando
- [ ] Identificar TODOS os riscos
- [ ] Formular TODAS as perguntas

**FASE 2 (Plano):**
- [ ] Gastar 40-60% do tempo pensando
- [ ] Considerar TODAS as alternativas
- [ ] Validar decisões 3x

**FASE 3 (Execução):**
- [ ] Revisar plano ANTES de cada commit
- [ ] Pensar em cada mudança
- [ ] Validar resultado 3x

---

#### 9.2 R16 (Regra de Ouro Martyn)

**Thinking Process:**
```markdown
1. Ler requisito
2. **PENSAR:** Há ambiguidades? (R21)
3. Se sim: **PAUSAR e PERGUNTAR** (R16)
4. Se não: Prosseguir com pensamento profundo
```

---

#### 9.3 R20 (Evitar Ambiguidade)

**10 Perguntas Obrigatórias:**
- Responder cada uma com raciocínio profundo
- Não assumir nenhuma resposta
- Validar 3x cada decisão

---

### 10. Score de Compliance

#### Cálculo do Score

**Pontuação:**
- Tempo de pensamento adequado (25 pontos)
- Revisão 3x feita (25 pontos)
- Riscos identificados (≥3) (20 pontos)
- Opções alternativas (≥2) (15 pontos)
- Edge cases considerados (≥5) (15 pontos)

**Total:** 100 pontos

#### Checklist Rápido

| Item | Pontos | ✅ |
|------|--------|---|
| Tempo pensamento ≥ 10% do total | 25 | ☐ |
| Revisão 3x completa | 25 | ☐ |
| Riscos identificados (≥3) | 20 | ☐ |
| Opções apresentadas (≥2) | 15 | ☐ |
| Edge cases considerados (≥5) | 15 | ☐ |
| **TOTAL** | **100** | |

### Níveis
- 🏆 **Excellent:** 95-100 pontos (pensamento exemplar)
- ✅ **Good:** 85-94 pontos (pensamento adequado)
- ⚠️ **Acceptable:** 75-84 pontos (pensamento superficial)
- ❌ **Insufficient:** < 75 pontos (resposta apressada)

---

## 📚 Referências

- [[03-RULES-GLOBAL#R21]]
- [[04-Protocolo-Tasks]]
- [[03-RULES-GLOBAL#R16]] (Regra de Ouro)
- [[03-RULES-GLOBAL#R20]] (Evitar Ambiguidade)
- [Thinking, Fast and Slow - Daniel Kahneman](https://en.wikipedia.org/wiki/Thinking,_Fast_and_Slow)
