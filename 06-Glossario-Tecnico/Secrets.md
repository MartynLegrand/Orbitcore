# Secrets 🔑

**O que é:**
Credenciais sensíveis (tokens, senhas, chaves) usadas por serviços.

**Por que importa aqui:**
Nunca devem ser hardcoded; usar `.env` ou secret manager.

**Exemplo prático:**
- `JWT_SECRET`, `DB_PASSWORD`, `PAYMENTS_PROVIDER_KEY`.

**Como pedir para a IA:**
> "Refatorar para carregar secrets de `.env` e validar na inicialização." 

**Referências:**
- [[07-Receitas-e-Playbooks/03-Checklist-Seguranca]]