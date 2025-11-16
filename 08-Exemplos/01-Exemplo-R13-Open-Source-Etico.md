# Exemplo Prático: R13 - Reaproveitamento Open-Source Ético

**Regra:** Pode reutilizar, adaptar e integrar código open-source, MAS deve manter licenças, atribuições e respeitar termos.

**Versão:** 1.0  
**Última atualização:** 2025-11-16

---

## 🎯 Objetivo do Exemplo

Demonstrar como integrar bibliotecas open-source de forma ética e em compliance com licenças.

---

## ✅ EXEMPLO BOM: Integração Correta

### Cenário
Precisamos adicionar autenticação JWT ao backend NestJS.

### 1. Escolha de Biblioteca

```bash
# Pesquisar bibliotecas de JWT
npm search jsonwebtoken

# Verificar licença ANTES de instalar
npm view jsonwebtoken license
# Output: MIT ✅ (permissiva, pode usar comercialmente)

# Verificar outras opções
npm view jose license
# Output: MIT ✅
```

### 2. Documentar a Escolha

**Arquivo:** `docs/02-Decisoes-Arquiteturais/003-jwt-library.md`

```markdown
# ADR 003: Biblioteca JWT

**Status:** Aceito  
**Data:** 2025-11-16  
**Decisor:** [Nome]

## Contexto
Precisamos implementar autenticação JWT no módulo Auth.

## Decisão
Usar a biblioteca `jsonwebtoken` versão 9.0.2

## Justificativa
- **Licença:** MIT (permissiva, compatível com nosso projeto)
- **Maturidade:** 10M+ downloads/semana
- **Manutenção:** Ativamente mantida
- **Segurança:** Sem vulnerabilidades críticas conhecidas

## Alternativas Consideradas
- `jose`: Mais moderno, mas menos adotado
- `passport-jwt`: Muito acoplado ao Passport

## Consequências
- ✅ Podemos usar, modificar e distribuir
- ✅ Uso comercial permitido
- ⚠️ Devemos manter aviso de copyright
```

### 3. Instalação com Documentação

```bash
# Instalar
npm install jsonwebtoken
npm install --save-dev @types/jsonwebtoken

# Gerar arquivo de licenças
npx license-checker --summary
```

### 4. Manter Atribuições

**Arquivo:** `LICENSE.md` (raiz do projeto)

```markdown
# Licenças de Dependências

Este projeto usa as seguintes bibliotecas open-source:

## jsonwebtoken (MIT License)
- **Versão:** 9.0.2
- **Autor:** Auth0
- **Repositório:** https://github.com/auth0/node-jsonwebtoken
- **Licença:** https://github.com/auth0/node-jsonwebtoken/blob/master/LICENSE

Copyright (c) 2015 Auth0, Inc. <support@auth0.com> (http://auth0.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

[...]
```

**OU criar arquivo separado:**

**Arquivo:** `THIRD_PARTY_LICENSES.md`

```markdown
# Third Party Licenses

## Dependencies

### jsonwebtoken (9.0.2)
- License: MIT
- Repository: https://github.com/auth0/node-jsonwebtoken
- Full license text: See licenses/jsonwebtoken.txt

[copiar texto completo da licença]
```

### 5. Uso Correto no Código

```typescript
// src/modules/auth/services/jwt.service.ts

/**
 * JWT Service using jsonwebtoken library
 * 
 * @see https://github.com/auth0/node-jsonwebtoken
 * @license MIT (jsonwebtoken)
 */
import * as jwt from 'jsonwebtoken';
import { Injectable } from '@nestjs/common';

@Injectable()
export class JwtService {
  private readonly secret = process.env.JWT_SECRET;

  /**
   * Generate JWT token
   * 
   * Uses jsonwebtoken library (MIT licensed)
   */
  generateToken(payload: any): string {
    return jwt.sign(payload, this.secret, {
      expiresIn: '1h',
    });
  }

  /**
   * Verify JWT token
   */
  verifyToken(token: string): any {
    return jwt.verify(token, this.secret);
  }
}
```

### 6. Documentar no README

**Arquivo:** `README.md`

```markdown
# OBM Auth Module

[...]

## Dependencies

This project uses the following open-source libraries:

- **jsonwebtoken** (MIT) - JWT implementation
- **bcrypt** (MIT) - Password hashing
- **class-validator** (MIT) - Validation

See [THIRD_PARTY_LICENSES.md](./THIRD_PARTY_LICENSES.md) for full license texts.

## License

This project is licensed under MIT License - see [LICENSE](LICENSE) for details.

### Third-Party Licenses

All third-party libraries used in this project retain their original licenses.
See [THIRD_PARTY_LICENSES.md](./THIRD_PARTY_LICENSES.md) for details.
```

### 7. CI/CD Check

**Arquivo:** `.github/workflows/license-check.yml`

```yaml
name: License Compliance

on: [push, pull_request]

jobs:
  check-licenses:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node
        uses: actions/setup-node@v3
        with:
          node-version: '18'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Check licenses
        run: |
          npx license-checker \
            --onlyAllow 'MIT;Apache-2.0;BSD-2-Clause;BSD-3-Clause;ISC;0BSD;CC0-1.0' \
            --failOn 'GPL;AGPL;LGPL;SSPL'
      
      - name: Generate license report
        run: npx license-checker --summary
```

**Resultado:** ✅ Integração ética, compliant, documentada

---

## ❌ EXEMPLO RUIM: Violação de Licença

### Cenário (ERRADO)
Usar biblioteca GPL em projeto comercial fechado.

### 1. Instalação Sem Verificação (ERRADO)

```bash
# Instalar sem verificar licença
npm install some-gpl-library

# ❌ ERRO: Não verificou que é GPL
```

### 2. Uso Sem Atribuição (ERRADO)

```typescript
// src/modules/payment/services/payment.service.ts

// ❌ Código copiado de biblioteca GPL sem atribuição
// ❌ Sem comentário sobre origem
// ❌ Fingindo ser código próprio

export class PaymentService {
  // Código copiado integral de biblioteca GPL
  processPayment(data: any) {
    // ... implementação copiada
  }
}
```

### 3. Remoção de Copyright (ERRADO)

**Código original da biblioteca:**
```typescript
/**
 * some-gpl-library
 * Copyright (c) 2020 Original Author
 * Licensed under GPL-3.0
 */
export function processPayment() { /* ... */ }
```

**Código no projeto (ERRADO):**
```typescript
// ❌ Removeu o copyright
// ❌ Removeu a licença
// ❌ Fingindo ser código próprio

export function processPayment() { /* ... */ }
```

### 4. Vender GPL como Fechado (ERRADO)

```markdown
# README.md

## License
❌ Proprietary License - All Rights Reserved
❌ Commercial use only by license

(Mas usa biblioteca GPL internamente)
```

**Problema:** GPL exige que o código derivado também seja GPL (copyleft)

**Consequências:**
- ⚖️ Processo judicial
- 💰 Indenizações
- 🚫 Produto retirado do mercado
- 📉 Reputação destruída

---

## ✅ EXEMPLO BOM: Adaptação de Código

### Cenário
Adaptar utility function de biblioteca MIT.

### 1. Código Original

**Fonte:** https://github.com/lodash/lodash/blob/master/debounce.js

```javascript
/**
 * lodash (MIT Licensed)
 * Copyright JS Foundation and other contributors
 */
function debounce(func, wait, options) {
  // ... implementação original
}
```

### 2. Adaptação Correta

**Arquivo:** `src/utils/debounce.util.ts`

```typescript
/**
 * Debounce utility function
 * 
 * Adapted from lodash.debounce (MIT Licensed)
 * Original: https://github.com/lodash/lodash/blob/master/debounce.js
 * Copyright JS Foundation and other contributors
 * 
 * Modifications:
 * - Converted to TypeScript
 * - Simplified options (removed trailing/leading)
 * - Added type safety
 * 
 * @license MIT (adapted from lodash)
 */
export function debounce<T extends (...args: any[]) => any>(
  func: T,
  wait: number
): (...args: Parameters<T>) => void {
  let timeout: NodeJS.Timeout | null = null;

  return function executedFunction(...args: Parameters<T>) {
    const later = () => {
      timeout = null;
      func(...args);
    };

    if (timeout) clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
}

/**
 * Original lodash license preserved:
 * 
 * Copyright JS Foundation and other contributors <https://js.foundation/>
 * 
 * Based on Underscore.js, copyright Jeremy Ashkenas,
 * DocumentCloud and Investigative Reporters & Editors <http://underscorejs.org/>
 * 
 * This software consists of voluntary contributions made by many
 * individuals. For exact contribution history, see the revision history
 * available at https://github.com/lodash/lodash
 * 
 * [Full MIT license text...]
 */
```

### 3. Documentar Adaptação

**Arquivo:** `CREDITS.md`

```markdown
# Credits

## Adapted Code

### debounce utility
- **Original:** lodash/debounce
- **License:** MIT
- **Modifications:** TypeScript conversion, simplified options
- **File:** `src/utils/debounce.util.ts`
- **Original Source:** https://github.com/lodash/lodash/blob/master/debounce.js
```

**Resultado:** ✅ Adaptação ética, atribuição mantida, modificações documentadas

---

## ✅ EXEMPLO BOM: Snippet do Stack Overflow

### Cenário
Usar snippet de código do Stack Overflow.

### 1. Código Original

**Fonte:** Stack Overflow question #12345678 (exemplo)

```javascript
// User "JohnDoe" answered:
function isValidEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}
```

### 2. Uso Correto

**Arquivo:** `src/validators/email.validator.ts`

```typescript
/**
 * Email validation utility
 * 
 * Regex pattern adapted from Stack Overflow:
 * https://stackoverflow.com/questions/12345678
 * Answer by user JohnDoe (CC BY-SA 4.0)
 * 
 * Note: Stack Overflow content is licensed under CC BY-SA 4.0
 * Attribution required.
 */
export function isValidEmail(email: string): boolean {
  // Regex from Stack Overflow (simplified for basic validation)
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}
```

### 3. Documentar no CREDITS

```markdown
# Credits

## Stack Overflow Snippets

### Email validation regex
- **Source:** https://stackoverflow.com/questions/12345678
- **Author:** JohnDoe (https://stackoverflow.com/users/123456/johndoe)
- **License:** CC BY-SA 4.0
- **File:** `src/validators/email.validator.ts`
```

**Resultado:** ✅ Atribuição correta, licença respeitada

---

## ❌ EXEMPLO RUIM: Copy-Paste Sem Atribuição

```typescript
// src/utils/helper.ts

// ❌ Código copiado do Stack Overflow sem atribuição
// ❌ Sem link para fonte
// ❌ Fingindo ser código original

export function isValidEmail(email: string): boolean {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}
```

**Problema:** Viola CC BY-SA 4.0 (requer atribuição)

---

## 🔧 Ferramentas de Compliance

### 1. License Checker (npm)

```bash
# Instalar
npm install -g license-checker

# Verificar todas as licenças
license-checker --summary

# Verificar licenças proibidas
license-checker --onlyAllow 'MIT;Apache-2.0;BSD-2-Clause;BSD-3-Clause;ISC'

# Exportar relatório
license-checker --json > licenses.json
```

### 2. FOSSA (CI/CD)

```yaml
# .github/workflows/fossa.yml
name: FOSSA License Scan

on: [push]

jobs:
  fossa:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Run FOSSA scan
        uses: fossas/fossa-action@v1
        with:
          api-key: ${{ secrets.FOSSA_API_KEY }}
```

### 3. License Finder (Ruby)

```bash
# Instalar
gem install license_finder

# Scan de dependências
license_finder

# Aprovar licenças específicas
license_finder permitted_licenses add MIT Apache-2.0 BSD-3-Clause
```

### 4. pip-licenses (Python)

```bash
# Instalar
pip install pip-licenses

# Listar licenças
pip-licenses

# Exportar para markdown
pip-licenses --format=markdown > LICENSES.md
```

---

## 📊 Checklist de Compliance

### Antes de Adicionar Dependência

- [ ] Verificar licença da biblioteca
- [ ] Licença é compatível com o projeto?
- [ ] Licença permite uso comercial (se aplicável)?
- [ ] Biblioteca é ativamente mantida?
- [ ] Sem vulnerabilidades conhecidas?

### Após Adicionar Dependência

- [ ] Documentar decisão (ADR)
- [ ] Adicionar licença em THIRD_PARTY_LICENSES.md
- [ ] Atualizar README com dependências
- [ ] Configurar CI/CD check
- [ ] Adicionar em CREDITS.md (se adaptado)

### Ao Adaptar Código

- [ ] Manter copyright original
- [ ] Documentar modificações
- [ ] Adicionar link para fonte
- [ ] Manter licença original
- [ ] Documentar em CREDITS.md

### Revisão Periódica

- [ ] Audit de licenças (trimestral)
- [ ] Atualizar dependências
- [ ] Verificar mudanças de licença
- [ ] Renovar documentação

---

## 📚 Referências

- [[03-RULES-GLOBAL#R13]]
- [[08-Checklist-R13-Open-Source-Etico]]
- [Choose a License](https://choosealicense.com/)
- [Open Source Licenses Comparison](https://opensource.org/licenses)
- [SPDX License List](https://spdx.org/licenses/)
- [FOSSA Documentation](https://fossa.com/docs)
