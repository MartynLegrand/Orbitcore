# Backend TS (NestJS) 🔧

## Estrutura
- Módulos, Controllers, Services.
- DTOs e validação.
- Guards (JWT/RBAC), Interceptors.

## Boas Práticas
- Padronizar respostas e erros.
- Separar domínios por módulos.
- Testes unitários e e2e.

## Exemplo
```ts
@Controller('auth')
export class AuthController {
  constructor(private readonly svc: AuthService) {}
  @Post('login')
  async login(@Body() dto: LoginDto) { return this.svc.login(dto); }
}
```

## Checklists
- Segurança: [[07-Receitas-e-Playbooks/03-Checklist-Seguranca]].
- Escalabilidade: [[07-Receitas-e-Playbooks/04-Checklist-Escalabilidade]].