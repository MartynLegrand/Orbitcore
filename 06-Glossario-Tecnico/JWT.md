# JWT (JSON Web Token) 🔐

**O que é:**
Token compactado em JSON, usado para autenticação/autorização entre duas partes.

**Por que importa aqui:**
Módulos `obm-*` que exigem login padronizam autenticação via JWT.

**Exemplo prático:**
```ts
// Validação de JWT (Node)
import jwt from "jsonwebtoken";
const payload = jwt.verify(token, process.env.JWT_SECRET);
```

**Como pedir para a IA:**
> "Crie um middleware de autenticação JWT para `obm-auth`, usando `JWT_SECRET` e expiração de 24h."

**Ferramentas comuns:**
- Node: `jsonwebtoken`
- Python: `pyjwt`

**Referências:**
- https://jwt.io/
- [[07-Receitas-e-Playbooks/03-Checklist-Seguranca]]