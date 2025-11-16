# Receitas Para Novos Módulos 🍳

## Passos
- Definir objetivo, contrato e stack.
- Escrever endpoints e SDK.
- Configurar `.env`, Docker e testes.

## Exemplo
```md
Módulo: obm-billing
Endpoints: /api/billing/invoices, /api/billing/pay
SDK: BillingClient
```

## Checklists
- Segurança (JWT, RBAC), escalabilidade (cache, filas), documentação.