# Checklist: R16 - Regra de Ouro Martyn

**Regra:** "Se houver mais de uma interpretação, PARE e PERGUNTE". Proibido assumir, inferir, inventar ou decidir sem confirmar.

**Versão:** 1.0  
**Última atualização:** 2025-11-16

---

## 📋 Checklist Completo

### 1. Identificação de Ambiguidade

#### 1.1 Sinais de Ambiguidade
- [ ] Requisito tem múltiplas interpretações possíveis?
- [ ] Termos vagos ou genéricos usados ("melhorar", "otimizar", "ajustar")?
- [ ] Falta informação técnica específica (versões, endpoints, formatos)?
- [ ] Conflito entre diferentes fontes de informação?
- [ ] Você está "imaginando" o que o usuário quis dizer?

#### 1.2 Checklist Anti-Ambiguidade
- [ ] **Pronomes vagos**: "isso", "aquilo", "ele" sem referência clara
- [ ] **Termos relativos**: "rápido", "lento", "grande", "pequeno" (sem métricas)
- [ ] **Palavras ambíguas**: "pode", "talvez", "mais ou menos"
- [ ] **Especificações incompletas**: "adicionar validação" (qual? onde? como?)
- [ ] **Contexto implícito**: assumir conhecimento não documentado

#### 1.3 Teste dos 5 Por quês
- [ ] Por que esta tarefa é necessária?
- [ ] Por que esta abordagem específica?
- [ ] Por que não alternativa X?
- [ ] Por que este prazo/prioridade?
- [ ] Por que eu (e não outro agente)?

Se qualquer resposta for "eu acho que...", você tem ambiguidade ❌

---

### 2. Categorias de Ambiguidade

#### 2.1 Ambiguidade de Escopo
**Sintoma:** Não está claro O QUE fazer

**Exemplos:**
- ❌ "Adicionar autenticação"
- ✅ "Adicionar autenticação OAuth2 com Google e GitHub no endpoint /api/v1/auth/login"

**Perguntas obrigatórias:**
- [ ] Quais funcionalidades EXATAMENTE devem ser incluídas?
- [ ] O que está FORA do escopo?
- [ ] Até onde devo ir? (MVP vs. completo)

#### 2.2 Ambiguidade Técnica
**Sintoma:** Não está claro COMO implementar

**Exemplos:**
- ❌ "Melhorar performance do banco"
- ✅ "Adicionar índice composto (user_id, created_at) na tabela orders para reduzir query time de 2s para < 200ms"

**Perguntas obrigatórias:**
- [ ] Qual stack/biblioteca usar?
- [ ] Qual padrão arquitetural aplicar?
- [ ] Quais constraints técnicas existem?

#### 2.3 Ambiguidade de Dados
**Sintoma:** Não está claro QUAIS dados envolvidos

**Exemplos:**
- ❌ "Migrar dados de usuários"
- ✅ "Migrar 50k registros da tabela users (apenas campos id, email, name) de PostgreSQL para Redis como cache, mantendo TTL de 1h"

**Perguntas obrigatórias:**
- [ ] Quais campos/tabelas específicas?
- [ ] Qual formato de entrada e saída?
- [ ] Há dados legados a considerar?

#### 2.4 Ambiguidade de Comportamento
**Sintoma:** Não está claro O QUE acontece em cada cenário

**Exemplos:**
- ❌ "Validar email do usuário"
- ✅ "Validar email com regex RFC 5322, retornar erro 400 com mensagem 'Invalid email format' se inválido, permitir prosseguir se válido"

**Perguntas obrigatórias:**
- [ ] O que acontece no happy path?
- [ ] O que acontece em cada edge case?
- [ ] Quais mensagens de erro exibir?

#### 2.5 Ambiguidade de Prioridade
**Sintoma:** Não está claro O QUE é mais importante

**Exemplos:**
- ❌ "Precisa ser rápido e ter todas as features"
- ✅ "Prioridade 1: Funcionalidade básica em 2 dias. Prioridade 2: Features extras se houver tempo"

**Perguntas obrigatórias:**
- [ ] Qual o trade-off preferido? (velocidade vs. qualidade)
- [ ] O que pode ser deixado para depois?
- [ ] Qual o prazo real (não o ideal)?

---

### 3. Protocolo de Clarificação

#### 3.1 ANTES de qualquer código
- [ ] **PAUSAR** a implementação
- [ ] Documentar a ambiguidade identificada
- [ ] Formular perguntas específicas
- [ ] Apresentar opções (mínimo 2 alternativas)
- [ ] **AGUARDAR** resposta antes de prosseguir

#### 3.2 Template de Pergunta

```markdown
## 🔍 Clarificação Necessária

**Contexto:**
[Descrever a tarefa e o que você entende até agora]

**Ambiguidade Identificada:**
[Explicar especificamente o que não está claro]

**Opções Identificadas:**

### Opção A: [Nome]
**Interpretação:** [Como você faria]
**Prós:** [Vantagens]
**Contras:** [Desvantagens]
**Esforço:** [Horas]

### Opção B: [Nome]
**Interpretação:** [Como você faria]
**Prós:** [Vantagens]
**Contras:** [Desvantagens]
**Esforço:** [Horas]

**Perguntas:**
1. Qual opção é preferida?
2. [Pergunta específica 2]
3. [Pergunta específica 3]

**Bloqueador:** Não posso prosseguir até obter clarificação ⛔
```

#### 3.3 Qualidade das Perguntas
- [ ] Perguntas são específicas (não genéricas)?
- [ ] Perguntas são objetivas (tem resposta clara)?
- [ ] Perguntas não podem ser respondidas com "depende"?
- [ ] Perguntas têm contexto suficiente?
- [ ] Opções alternativas são apresentadas?

**Exemplo Ruim:**
❌ "Como devo fazer isso?"

**Exemplo Bom:**
✅ "Devo usar Opção A (Redis com TTL 1h, mais rápido mas volátil) ou Opção B (PostgreSQL com indexed column, mais lento mas persistente)? O requisito prioriza velocidade ou confiabilidade?"

---

### 4. 5 Cenários Clássicos de Ambiguidade

#### Cenário 1: "Adicionar um botão"

**Ambiguidade:**
- Qual texto no botão?
- Onde posicionar?
- Qual ação ao clicar?
- Qual estilo (cor, tamanho)?
- Mobile e desktop?

**Perguntas obrigatórias:**
1. Qual o label exato do botão?
2. Qual a posição exata (acima/abaixo/ao lado de qual elemento)?
3. Qual a ação ao clicar (navigate, submit, open modal)?
4. Qual o estilo (primary, secondary, danger)?
5. Há diferença entre mobile e desktop?

---

#### Cenário 2: "Corrigir o bug do login"

**Ambiguidade:**
- Qual bug específico?
- Em qual cenário ocorre?
- Qual comportamento esperado?
- Qual impacto (crítico ou não)?

**Perguntas obrigatórias:**
1. Qual o comportamento atual (exato erro/sintoma)?
2. Em quais cenários ocorre (always, sometimes, edge case)?
3. Qual o comportamento esperado?
4. Há logs de erro disponíveis?
5. Qual a criticidade (bloqueia prod, pode esperar)?

---

#### Cenário 3: "Melhorar performance"

**Ambiguidade:**
- Performance de quê?
- Qual métrica atual?
- Qual meta de melhoria?
- Qual parte do sistema?

**Perguntas obrigatórias:**
1. Qual métrica específica (response time, throughput, memory)?
2. Qual o valor atual (com evidência)?
3. Qual a meta (valor objetivo)?
4. Em qual parte do sistema (endpoint, query, função)?
5. Há profiling data disponível?

---

#### Cenário 4: "Integrar com API X"

**Ambiguidade:**
- Qual versão da API?
- Quais endpoints usar?
- Qual autenticação?
- Qual tratamento de erro?

**Perguntas obrigatórias:**
1. Qual a versão da API (v1, v2, latest)?
2. Quais endpoints específicos consumir?
3. Qual método de autenticação (API key, OAuth, JWT)?
4. Como tratar rate limiting e erros?
5. Há documentação/SDK disponível?

---

#### Cenário 5: "Seguir o padrão do módulo Y"

**Ambiguidade:**
- Qual módulo exatamente?
- Quais aspectos copiar?
- Adaptações necessárias?

**Perguntas obrigatórias:**
1. Qual o módulo de referência (path completo)?
2. Quais aspectos seguir (estrutura, naming, patterns)?
3. Quais diferenças são aceitáveis?
4. Devo copiar testes também?
5. Há exceções ao padrão?

---

### 5. Comportamentos Proibidos

#### 5.1 ❌ Assumir
**Exemplo:**
"O usuário provavelmente quer usar PostgreSQL, então vou usar"

**Por que é ruim:**
- Pode não ser a escolha correta
- Gera retrabalho se errado
- Pode conflitar com outros sistemas

**O que fazer:**
✅ "Devo usar PostgreSQL (já usado no sistema) ou MongoDB (melhor para este caso)? Qual a preferência?"

---

#### 5.2 ❌ Inferir
**Exemplo:**
"Como o projeto usa React, vou usar Styled Components"

**Por que é ruim:**
- Inferência pode estar errada (projeto pode usar CSS Modules)
- Inconsistência com o resto da base
- Divergência de padrões

**O que fazer:**
✅ "Vejo que o projeto usa React. Qual biblioteca de estilos usar: Styled Components (vejo em moduleA) ou CSS Modules (vejo em moduleB)?"

---

#### 5.3 ❌ Inventar
**Exemplo:**
"Não especificaram mensagem de erro, vou inventar uma"

**Por que é ruim:**
- Mensagem pode não ser adequada para usuários
- Pode faltar i18n
- Inconsistente com outras mensagens

**O que fazer:**
✅ "Qual a mensagem de erro exata a exibir quando email é inválido? Deve ser em pt-BR, en-US ou ambos?"

---

#### 5.4 ❌ Decidir Sozinho
**Exemplo:**
"Vou criar um novo padrão porque acho melhor"

**Por que é ruim:**
- Cria inconsistência
- Pode não ser aprovado depois
- Confunde a equipe

**O que fazer:**
✅ "Identifiquei 2 padrões existentes (A e B). Devo seguir um deles ou criar um padrão novo C? Se novo, preciso de aprovação arquitetural"

---

### 6. Ferramentas de Validação

#### 6.1 Checklist de Auto-Validação
Antes de cada ação, pergunte-se:

- [ ] Eu tenho 100% de certeza do que fazer?
- [ ] Se alguém me perguntar "por que assim?", tenho resposta documentada?
- [ ] Não estou fazendo suposições não validadas?
- [ ] Todas as decisões foram explicitamente aprovadas?

Se qualquer resposta for "não", você tem ambiguidade ❌

---

#### 6.2 Teste de Explicação para Terceiros
**Exercício:** Explique sua implementação para alguém que não conhece o contexto

Se você usar frases como:
- "Eu acho que..."
- "Provavelmente..."
- "Deve ser..."
- "Normalmente é..."

Você tem ambiguidade ❌

---

#### 6.3 Revisão de Decisões

| Decisão | Fonte | Confiança | Status |
|---------|-------|-----------|--------|
| Usar PostgreSQL | README.md line 45 | 100% | ✅ OK |
| Port 3000 | Assumido | 50% | ❌ CONFIRMAR |
| Validação de email | User story #123 | 100% | ✅ OK |
| Timeout 30s | Inferido | 60% | ❌ CONFIRMAR |

**Regra:** Confiança < 90% = Perguntar ❌

---

### 7. Integração com Protocolo .TASK

#### 7.1 FASE 1 (Análise)
**Checkpoint Obrigatório:**
- [ ] Todas as ambiguidades identificadas?
- [ ] Todas as perguntas formuladas?
- [ ] Aguardando respostas antes de prosseguir para FASE 2?

#### 7.2 FASE 2 (Plano)
**Checkpoint Obrigatório:**
- [ ] Decisões técnicas têm fonte clara?
- [ ] Opções alternativas apresentadas e discutidas?
- [ ] Escolhas finais foram explicitamente aprovadas?

#### 7.3 FASE 3 (Execução)
**Checkpoint Obrigatório:**
- [ ] Implementação segue exatamente o plano aprovado?
- [ ] Não houve "ajustes" ou "melhorias" não aprovadas?
- [ ] Desvios foram reportados e aprovados?

---

### 8. Exemplos Práticos

#### ✅ EXEMPLO BOM: Identificação e Clarificação

**Tarefa Original:**
"Adicionar filtro na lista de produtos"

**Análise:**
```markdown
## Ambiguidades Identificadas

1. **Qual campo filtrar?** (nome, categoria, preço, disponibilidade?)
2. **Tipo de filtro?** (dropdown, search box, multi-select?)
3. **Posição?** (topo da página, sidebar, modal?)
4. **Comportamento?** (filtro em tempo real ou botão "aplicar"?)
5. **Mobile?** (mesmo filtro ou versão simplificada?)

## Opções Propostas

### Opção A: Filtro por categoria (dropdown)
- Filtro simples, top da página
- Aplicação automática ao selecionar
- Mesma UI mobile/desktop

### Opção B: Filtro avançado (múltiplos campos)
- Sidebar com categoria, preço, disponibilidade
- Botão "Aplicar Filtros"
- Modal no mobile

## Perguntas
1. Qual opção preferida?
2. Quais campos devem ser filtráveis?
3. Há algum filtro padrão ao carregar a página?
```

**Resultado:** Cliente escolheu Opção A + campo de busca por nome ✅

---

#### ❌ EXEMPLO RUIM: Assumir e Implementar

**Tarefa Original:**
"Adicionar filtro na lista de produtos"

**Implementação (errado):**
```typescript
// Desenvolvedor assumiu:
// - Filtro por nome (não confirmado)
// - Search box no topo (não confirmado)
// - Filtro em tempo real (não confirmado)
// - Mesma UI mobile/desktop (não confirmado)

function ProductList() {
  const [filter, setFilter] = useState('');
  
  return (
    <div>
      <input 
        type="text" 
        placeholder="Buscar produto..." // assumido
        onChange={(e) => setFilter(e.target.value)} 
      />
      {/* ... */}
    </div>
  );
}
```

**Resultado:** Cliente queria filtro por categoria com dropdown ❌ **Retrabalho total**

---

### 9. Score de Compliance

#### Cálculo do Score

**Pontuação:**
- Identificação de ambiguidades (30 pontos)
- Formulação de perguntas (25 pontos)
- Apresentação de opções (20 pontos)
- Aguardar aprovação (15 pontos)
- Zero suposições (10 pontos)

**Total:** 100 pontos

#### Checklist Rápido

| Item | Pontos | ✅ |
|------|--------|---|
| Todas as ambiguidades identificadas | 30 | ☐ |
| Perguntas específicas formuladas | 25 | ☐ |
| Opções alternativas apresentadas | 20 | ☐ |
| Aguardou aprovação antes de codar | 15 | ☐ |
| Zero suposições não validadas | 10 | ☐ |
| **TOTAL** | **100** | |

### Níveis
- 🏆 **Excellent:** 95-100 pontos (nenhuma suposição)
- ✅ **Good:** 85-94 pontos (suposições mínimas validadas)
- ⚠️ **Acceptable:** 75-84 pontos (algumas suposições)
- ❌ **Insufficient:** < 75 pontos (muitas suposições)

---

## 📚 Referências

- [[03-RULES-GLOBAL#R16]]
- [[03-RULES-GLOBAL#R20]] (complementar)
- [[04-Protocolo-Tasks#FASE-1]]
- [[01-Template-Analise]]
