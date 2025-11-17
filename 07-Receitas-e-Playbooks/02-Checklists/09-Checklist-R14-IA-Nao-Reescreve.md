# Checklist: R14 - IA Não Reescreve Tudo

**Regra:** A IA só deve fazer alterações cirúrgicas e mínimas. Proibido reescrever arquivos inteiros ou alterar stack tecnológica.

**Versão:** 1.0  
**Última atualização:** 2025-11-16

---

## 📋 Checklist Completo

### 1. Princípios de Alteração Mínima

#### 1.1 Escopo da Alteração
- [ ] A alteração afeta APENAS as linhas necessárias?
- [ ] Mantém o contexto ao redor intacto (imports, funções vizinhas)?
- [ ] Não remove código funcional existente sem justificativa?
- [ ] Preserva comentários relevantes?
- [ ] Mantém formatação/estilo existente?

#### 1.2 Mudanças Permitidas (✅)
- [ ] Ajuste de imports (adicionar/remover específicos)
- [ ] Correção de tipos TypeScript (strict mode)
- [ ] Atualização de paths relativos
- [ ] Ajuste de configurações (tsconfig, package.json)
- [ ] Correção de bugs pontuais (1-5 linhas)
- [ ] Adição de validações de entrada
- [ ] Atualização de variáveis de ambiente

#### 1.3 Mudanças Proibidas (❌)
- [ ] Verificar que NÃO reescreveu arquivo inteiro
- [ ] Verificar que NÃO alterou funções públicas/exports
- [ ] Verificar que NÃO trocou stack (React → Vue, NestJS → Express)
- [ ] Verificar que NÃO refatorou arquitetura geral
- [ ] Verificar que NÃO renomeou funções/classes públicas
- [ ] Verificar que NÃO alterou contratos de API
- [ ] Verificar que NÃO mudou estrutura de dados exportada

### 2. Validação de Diff

#### 2.1 Tamanho do Diff
- [ ] Diff total < 200 linhas por commit? (ideal: < 50)
- [ ] Se > 200 linhas: está dividido em commits atômicos?
- [ ] Cada commit tem uma única responsabilidade?
- [ ] Proporção de linhas alteradas vs. total do arquivo < 30%?

**Cálculo:**
```bash
git diff --shortstat HEAD~1
# Exemplo aceitável: "5 files changed, 47 insertions(+), 23 deletions(-)"
# Exemplo suspeito: "2 files changed, 847 insertions(+), 856 deletions(-)"
```

#### 2.2 Análise de Contexto
- [ ] As linhas ao redor das alterações foram preservadas?
- [ ] A estrutura de indentação foi mantida?
- [ ] Os comentários importantes foram preservados?
- [ ] O estilo de código existente foi respeitado?

#### 2.3 Impacto Funcional
- [ ] A alteração NÃO quebra testes existentes?
- [ ] A alteração NÃO muda comportamento público?
- [ ] APIs públicas mantêm compatibilidade retroativa?
- [ ] Contratos de interface mantidos?

### 3. Quando Chamar o Executor

#### 3.1 Situações que Requerem Executor
- [ ] Diff > 200 linhas em um único arquivo
- [ ] Alteração em funções públicas/exports
- [ ] Mudança em contratos de API
- [ ] Refatoração de arquitetura
- [ ] Risco de breaking changes
- [ ] Múltiplos módulos afetados

#### 3.2 Processo de Escalação
1. [ ] **PAUSAR** implementação imediatamente
2. [ ] Documentar o que foi feito até agora
3. [ ] Criar handoff para o Executor (usar Template-Handoff)
4. [ ] Listar as preocupações específicas
5. [ ] Aguardar validação antes de prosseguir

### 4. Tipos de Arquivo

#### 4.1 Arquivos de Configuração (mais flexível)
- [ ] `package.json`: apenas dependências necessárias adicionadas
- [ ] `tsconfig.json`: apenas flags específicas ajustadas
- [ ] `.env.example`: apenas novas variáveis documentadas
- [ ] `docker-compose.yml`: apenas serviços necessários adicionados

#### 4.2 Código-Fonte (mais rigoroso)
- [ ] `.ts/.js`: máximo 30% do arquivo alterado
- [ ] `.tsx/.jsx`: separar lógica de UI (R17)
- [ ] Testes: adicionar novos, NÃO modificar existentes
- [ ] Utilitários: criar novos, NÃO reescrever existentes

#### 4.3 Documentação (flexível com validação)
- [ ] `README.md`: adicionar seções, NÃO remover existentes
- [ ] API docs: adicionar endpoints, marcar deprecated se remover
- [ ] Comentários inline: adicionar/clarificar, não remover

### 5. Checklist de Validação Técnica

#### 5.1 Testes
- [ ] Todos os testes existentes passam?
- [ ] Novos testes foram adicionados (não modificados)?
- [ ] Cobertura de código mantida ou aumentada?

```bash
# Validar antes/depois
npm test -- --coverage
# Coverage should be: maintained or increased
```

#### 5.2 Build
- [ ] Build passa sem erros?
- [ ] Build passa sem novos warnings?
- [ ] Tipos TypeScript corretos?

```bash
npm run build
npx tsc --noEmit
```

#### 5.3 Linter
- [ ] ESLint passa sem novos erros?
- [ ] Prettier mantém formatação consistente?

```bash
npm run lint
npm run format -- --check
```

### 6. Revisão Manual

#### 6.1 Revisão de Código
- [ ] Ler o diff linha por linha
- [ ] Identificar qualquer linha "estranha" ou desnecessária
- [ ] Verificar se há código comentado (code smell)
- [ ] Procurar por logs de debug esquecidos (console.log, print)

#### 6.2 Checklist de Qualidade
- [ ] A alteração resolve o problema original?
- [ ] A alteração é a MÍNIMA necessária?
- [ ] Há uma forma ainda mais simples de resolver?
- [ ] O código mantém legibilidade?
- [ ] O código mantém padrões do projeto?

### 7. Exemplos Práticos

#### ✅ EXEMPLO BOM: Alteração Cirúrgica

**Antes:**
```typescript
// src/services/user.service.ts
export class UserService {
  async getUser(id: string) {
    return this.db.users.findById(id);
  }
}
```

**Depois (adicionar validação):**
```typescript
// src/services/user.service.ts
export class UserService {
  async getUser(id: string) {
    if (!id) throw new Error('User ID is required'); // NOVA LINHA
    return this.db.users.findById(id);
  }
}
```

**Diff:** 1 linha adicionada ✅

---

#### ❌ EXEMPLO RUIM: Reescrita Total

**Antes:**
```typescript
// src/services/user.service.ts (50 linhas)
export class UserService {
  async getUser(id: string) { /* ... */ }
  async createUser(data: UserDTO) { /* ... */ }
  async updateUser(id: string, data: Partial<UserDTO>) { /* ... */ }
  // ... mais 10 métodos
}
```

**Depois (reescrita completa):**
```typescript
// src/services/user.service.ts (120 linhas)
import { Injectable, Logger } from '@nestjs/common';
// ... 20 novos imports

@Injectable()
export class UserService {
  private readonly logger = new Logger(UserService.name);
  
  constructor(
    // ... 5 novas dependências
  ) {}

  async getUser(id: string) {
    // Completamente reescrito com try/catch, logs, etc
  }
  // ... todos os métodos reescritos
}
```

**Diff:** 70+ linhas alteradas ❌ **PROIBIDO**

---

#### ✅ EXEMPLO BOM: Ajuste de Import

**Diff:**
```diff
- import { User } from './models';
+ import { User } from './models/user.model';
```

**Análise:** 1 linha, ajuste de path ✅

---

#### ❌ EXEMPLO RUIM: Mudança de Stack

**Diff:**
```diff
- import express from 'express';
- const app = express();
+ import { NestFactory } from '@nestjs/core';
+ import { AppModule } from './app.module';
+ const app = await NestFactory.create(AppModule);
```

**Análise:** Mudança de stack ❌ **PROIBIDO**

### 8. Ferramentas de Validação

#### 8.1 Diff Size Checker (automático)
```bash
#!/bin/bash
# .github/hooks/check-diff-size.sh

MAX_LINES=200
DIFF_SIZE=$(git diff --cached --shortstat | grep -oP '\d+(?= insertion)' || echo "0")

if [ "$DIFF_SIZE" -gt "$MAX_LINES" ]; then
  echo "❌ Diff muito grande: $DIFF_SIZE linhas (máximo: $MAX_LINES)"
  echo "Considere dividir em commits menores ou chamar o Executor"
  exit 1
fi

echo "✅ Diff size OK: $DIFF_SIZE linhas"
```

#### 8.2 Changed Files Ratio
```bash
#!/bin/bash
# Verificar proporção de linhas alteradas por arquivo

for file in $(git diff --cached --name-only); do
  TOTAL=$(wc -l < "$file")
  CHANGED=$(git diff --cached "$file" | grep -c "^[+-]")
  RATIO=$((CHANGED * 100 / TOTAL))
  
  if [ "$RATIO" -gt 30 ]; then
    echo "⚠️ $file: ${RATIO}% alterado (> 30%)"
  fi
done
```

#### 8.3 API Contract Checker
```typescript
// scripts/check-api-breaking-changes.ts
import { diff } from 'jest-diff';
import { oldAPI, newAPI } from './api-snapshot';

const breaking = diff(oldAPI.exports, newAPI.exports);
if (breaking) {
  console.error('❌ Breaking changes detected in API');
  console.error(breaking);
  process.exit(1);
}
```

### 9. Integração CI/CD

#### 9.1 GitHub Actions
```yaml
# .github/workflows/validate-changes.yml
name: Validate Minimal Changes

on: [pull_request]

jobs:
  check-diff-size:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      
      - name: Check diff size
        run: |
          FILES=$(git diff --name-only origin/main...HEAD)
          for file in $FILES; do
            LINES=$(git diff origin/main...HEAD -- "$file" | wc -l)
            if [ "$LINES" -gt 200 ]; then
              echo "::error file=$file::Diff too large: $LINES lines"
              exit 1
            fi
          done
      
      - name: Check for stack changes
        run: |
          if git diff origin/main...HEAD -- package.json | grep -E '"(express|nest|fastapi|flask)"'; then
            echo "::warning::Potential stack change detected"
          fi
```

#### 9.2 Pre-commit Hook
```bash
# .husky/pre-commit
#!/bin/bash
npm run lint
npm run test -- --onlyChanged
.github/hooks/check-diff-size.sh
```

### 10. Score de Compliance

#### Cálculo do Score

**Pontuação por categoria:**
- Escopo mínimo (30 pontos)
- Diff validado (25 pontos)
- Impacto funcional (20 pontos)
- Validação técnica (15 pontos)
- Revisão manual (10 pontos)

**Total:** 100 pontos

#### Níveis
- 🏆 **Excellent:** 95-100 pontos (ideal)
- ✅ **Good:** 85-94 pontos (aceitável)
- ⚠️ **Acceptable:** 75-84 pontos (revisar)
- ❌ **Insufficient:** < 75 pontos (rejeitar)

---

## 📊 Resultado da Validação

### Score Obtido

| Categoria | Peso | Pontos | Score |
|-----------|------|--------|-------|
| Escopo mínimo | 30% | __/30 | __% |
| Diff validado | 25% | __/25 | __% |
| Impacto funcional | 20% | __/20 | __% |
| Validação técnica | 15% | __/15 | __% |
| Revisão manual | 10% | __/10 | __% |
| **TOTAL** | **100%** | **__/100** | **__%** |

### Gaps Identificados

1. [ ] Gap 1: _______________
2. [ ] Gap 2: _______________
3. [ ] Gap 3: _______________

### Ações Corretivas

1. [ ] Ação 1: _______________
2. [ ] Ação 2: _______________

---

## ✅ Aprovação Final

- [ ] Score ≥ 85%
- [ ] Sem gaps críticos
- [ ] Aprovado por: _______________ (Data: _______)

---

**Observações:**

_____________________________________
_____________________________________

---

## 📚 Referências

- [[03-RULES-GLOBAL#R14]]
- [[04-Protocolo-Tasks]]
- [[01-Template-Execucao]]
- [Semantic Versioning](https://semver.org/)
- [Conventional Commits](https://www.conventionalcommits.org/)
