# RBAC (Role-Based Access Control) 🔐

**O que é:**
Modelo de autorização baseado em papéis (roles) e permissões.

**Por que importa aqui:**
Controla acesso em módulos como `obm-auth`, `obm-chat`, `obm-payments`.

**Exemplo prático:**
```ts
// Guard de RBAC em NestJS
@UseGuards(JwtAuthGuard, RolesGuard)
@Roles('admin')
@Get('/admin')
getAdmin() { /* ... */ }
```

**Como pedir para a IA:**
> "Adicione RBAC ao `obm-auth` com roles `user`, `admin` e testes." 

**Ferramentas comuns:**
- NestJS: decorators/guards
- FastAPI: dependencies com escopos

**Referências:**
- [[06-Glossario-Tecnico/JWT]]