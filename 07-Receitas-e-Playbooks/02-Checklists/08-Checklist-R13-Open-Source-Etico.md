# Checklist: R13 - Reaproveitamento Open-Source Ético 📜

> **Regra:** 13
> **Categoria:** Legal/Ética
> **Prioridade:** CRÍTICA
> **Baseado em:** [[00-Config/03-RULES-GLOBAL#13]]

## Visão Geral da Regra

**Princípio:** Reutilizar código open-source de forma ética, respeitando licenças e dando atribuição adequada.

**Objetivo:** Garantir compliance legal e ético no uso de código de terceiros.

---

## Checklist Detalhado

### 1. Verificação de Licenças

#### 1.1 Identificar Dependências
- [ ] Listar todas as dependências diretas
- [ ] Listar todas as dependências transitivas
- [ ] Documentar versões específicas

**Como fazer:**
```bash
# Node.js
npm list --depth=0  # Diretas
npm list            # Todas

# Python
pip list
pip show [package-name]

# Go
go list -m all
```

---

#### 1.2 Verificar Licenças
- [ ] Rodar ferramenta de verificação de licenças
- [ ] Documentar licença de cada dependência
- [ ] Identificar licenças incompatíveis

**Ferramentas:**
```bash
# Node.js
npx license-checker --summary
npx license-checker --json > licenses.json

# Python
pip-licenses --format=markdown > licenses.md
pip-licenses --format=json > licenses.json

# Go
go-licenses report ./... --template=licenses.tpl
```

---

#### 1.3 Classificar Licenças

**Permitidas (✅):**
- [ ] MIT
- [ ] Apache 2.0
- [ ] BSD (2-clause, 3-clause)
- [ ] ISC
- [ ] CC0 (Public Domain)

**Requerem Atenção (⚠️):**
- [ ] LGPL (permite uso se não modificar)
- [ ] MPL (Mozilla Public License)
- [ ] EPL (Eclipse Public License)

**Proibidas para uso proprietário (❌):**
- [ ] GPL (todas as versões)
- [ ] AGPL
- [ ] Copyleft restritivas

**Ação:** Se encontrar licenças proibidas, buscar alternativas ou obter aprovação legal.

---

### 2. Atribuição e Créditos

#### 2.1 Arquivo LICENSE
- [ ] Arquivo `LICENSE` ou `LICENSE.md` presente no repositório
- [ ] Licença do projeto claramente especificada
- [ ] Se usar código de terceiros, manter avisos originais

**Localização:** `/LICENSE` ou `/LICENSE.md`

---

#### 2.2 Arquivo CREDITS ou NOTICE
- [ ] Criar `CREDITS.md` ou `NOTICE.md` se usar código de terceiros
- [ ] Listar todas as bibliotecas/códigos reutilizados
- [ ] Incluir links para projetos originais
- [ ] Incluir textos de licença quando requerido

**Template CREDITS.md:**
```markdown
# Credits

This project uses the following open-source libraries and code:

## Library Name
- **Author:** [Author Name]
- **License:** MIT
- **Source:** https://github.com/author/library
- **Usage:** [Describe how it's used]

## Another Library
- **Author:** [Author Name]
- **License:** Apache 2.0
- **Source:** https://github.com/author/another
- **Usage:** [Describe how it's used]
```

---

#### 2.3 Atribuição em Código
- [ ] Comentários de atribuição em código adaptado
- [ ] Links para fonte original
- [ ] Avisos de modificação (se aplicável)

**Exemplo:**
```typescript
/**
 * Authentication adapter based on NextAuth.js
 * 
 * Original: https://github.com/nextauthjs/next-auth
 * License: ISC License
 * Modifications: Adapted for OBM architecture
 */
export class OBMAuthAdapter extends NextAuthAdapter {
  // Nossa customização
}
```

---

### 3. Uso Ético

#### 3.1 Preservar Avisos
- [ ] Avisos de copyright não removidos
- [ ] Textos de licença não alterados
- [ ] Histórico de contribuidores preservado (se aplicável)

---

#### 3.2 Não Fingir Autoria
- [ ] Não clamar autoria de código de terceiros
- [ ] Não remover nomes de autores originais
- [ ] Dar crédito apropriado

**❌ ERRADO:**
```typescript
// Código por: Minha Empresa
function hashPassword(password) {
  // [código copiado de bcrypt sem mencionar]
}
```

**✅ CORRETO:**
```typescript
/**
 * Password hashing using bcrypt
 * Based on: https://github.com/kelektiv/node.bcrypt.js
 * License: MIT
 */
import bcrypt from 'bcrypt';

function hashPassword(password) {
  return bcrypt.hash(password, 10);
}
```

---

#### 3.3 Respeitar Termos de Uso
- [ ] Ler e entender termos da licença
- [ ] Cumprir requisitos (ex: incluir aviso em docs)
- [ ] Não violar copyleft (GPL vendido como fechado)

---

### 4. Contribuições de Volta

#### 4.1 Considerar Contribuir
- [ ] Bugs corrigidos reportados upstream
- [ ] Melhorias úteis contribuídas via PR
- [ ] Documentação melhorada compartilhada

**Não obrigatório, mas recomendado:** Fortalecer comunidade open-source.

---

#### 4.2 Licença de Contribuições
- [ ] Contribuições próprias sob licença compatível
- [ ] CLA (Contributor License Agreement) assinado se requerido
- [ ] Direitos de contribuição claros

---

### 5. Documentação

#### 5.1 README
- [ ] Seção de "Dependencies" ou "Third-Party Libraries"
- [ ] Links para licenças
- [ ] Menção a ferramentas de verificação

**Exemplo em README:**
```markdown
## Dependencies

This project uses several open-source libraries. See [CREDITS.md](CREDITS.md) for full list and licenses.

To verify licenses:
```bash
npm run check-licenses
```

---

#### 5.2 Package Files
- [ ] `package.json` com campo `license`
- [ ] `setup.py` com `license` especificado
- [ ] `go.mod` com licença no README

**Exemplo package.json:**
```json
{
  "name": "@obm/module-name",
  "version": "1.0.0",
  "license": "MIT",
  "dependencies": {
    "library-name": "^1.0.0"
  }
}
```

---

### 6. CI/CD Checks

#### 6.1 Automated License Check
- [ ] CI configurado para verificar licenças
- [ ] Build falha se licença proibida detectada
- [ ] Relatório de licenças gerado automaticamente

**GitHub Actions exemplo:**
```yaml
name: License Check

on: [push, pull_request]

jobs:
  license-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
      - run: npm ci
      - run: npx license-checker --onlyAllow 'MIT;Apache-2.0;BSD-2-Clause;BSD-3-Clause;ISC'
```

---

#### 6.2 Dependency Updates
- [ ] Dependabot ou Renovate configurado
- [ ] Atualizações revisadas para mudanças de licença
- [ ] Licenças re-verificadas após updates

---

### 7. Casos Especiais

#### 7.1 Código Adaptado
- [ ] Se modificar código OS, documentar mudanças
- [ ] Preservar licença original
- [ ] Adicionar aviso de modificação

**Exemplo:**
```typescript
/**
 * Based on: express-rate-limit
 * Source: https://github.com/nfriedly/express-rate-limit
 * License: MIT
 * 
 * Modifications:
 * - Adapted for NestJS architecture
 * - Added Redis backend support
 * - Custom error messages
 */
```

---

#### 7.2 Snippets e Stack Overflow
- [ ] Snippets pequenos (< 10 linhas) geralmente OK sem atribuição
- [ ] Código substancial requer atribuição
- [ ] Link para fonte original se possível

---

#### 7.3 Bibliotecas Internas
- [ ] Módulos `obm-*` podem reutilizar entre si
- [ ] Atribuição interna documentada
- [ ] Licenças consistentes no ecossistema

---

### 8. Auditoria Periódica

#### 8.1 Frequência
- [ ] Auditoria de licenças a cada release major
- [ ] Verificação antes de cada deploy em produção
- [ ] Review após adicionar dependências novas

---

#### 8.2 Relatório de Auditoria
- [ ] Relatório de licenças gerado
- [ ] Gaps identificados e corrigidos
- [ ] Aprovação de legal (se necessário)

---

## Exemplos Práticos

### ✅ BOM - Uso Ético

**1. Usar biblioteca MIT com atribuição:**
```typescript
import axios from 'axios'; // MIT License

// Em CREDITS.md:
// ## axios
// - License: MIT
// - Source: https://github.com/axios/axios
```

**2. Adaptar código com créditos:**
```typescript
/**
 * Rate limiter adapted from express-rate-limit
 * Original: https://github.com/nfriedly/express-rate-limit (MIT)
 * 
 * Modifications for OBM:
 * - NestJS decorator pattern
 * - Redis backend
 */
@Injectable()
export class RateLimiter {
  // implementação adaptada
}
```

---

### ❌ RUIM - Violações

**1. Remover aviso de licença:**
```typescript
// ❌ PROIBIDO
// Código copiado de biblioteca X sem mencionar
function someFunction() {
  // [código copiado]
}
```

**2. Vender GPL como fechado:**
```typescript
// ❌ PROIBIDO
// Usar biblioteca GPL em produto proprietário sem
// abrir código fonte
```

**3. Fingir autoria:**
```typescript
// ❌ PROIBIDO
/**
 * @author Minha Empresa
 * Função de hash original
 */
function hash(data) {
  // [código copiado de bcrypt]
}
```

---

## Ferramentas Recomendadas

### Node.js/TypeScript:
- `license-checker` - Verificação de licenças
- `license-checker-rseidelsohn` - Versão mantida
- `FOSSA` - Compliance automatizado (pago)

### Python:
- `pip-licenses` - Listagem de licenças
- `liccheck` - Verificação de licenças
- `scancode-toolkit` - Análise profunda

### Go:
- `go-licenses` - Verificação de licenças
- `golicense` - Análise de licenças

### Multi-linguagem:
- `FOSSA` - Plataforma completa
- `WhiteSource` - Gestão de OSS
- `Snyk` - Segurança + Licenças

---

## Score de Compliance

**Checklist completo:**
- **Básico (Mínimo):** Items 1, 2.1, 2.2, 3.1, 3.2, 5.1 (✅ 6/8 = 75%)
- **Completo (Recomendado):** Todos os items (✅ 100%)

**Requisito:** ✅ Mínimo 75% para aprovação

---

## Referências

- [[00-Config/03-RULES-GLOBAL#13]] - Definição da regra
- [[08-Referencias-Externas/04-Catalogo-OS-3D-LLM-Reuso]] - Catálogo de recursos OS
- [choosealicense.com](https://choosealicense.com) - Guia de licenças
- [TLDRLegal](https://tldrlegal.com) - Explicação de licenças

---

> [!success] Compliance Verificado
> Se todos os items estão ✅, o projeto está em compliance com R13.

**Última Verificação:** [YYYY-MM-DD]
**Verificado por:** [Nome]
**Próxima Auditoria:** [Data]
