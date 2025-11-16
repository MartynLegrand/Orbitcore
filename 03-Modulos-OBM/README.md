# Índice de Módulos OBM 📚

## Módulos Core

| Módulo | Descrição | Documentação | OpenAPI |
|--------|-----------|--------------|---------|
| **obm-chat** 💬 | Chat e mensagens em tempo real | [📄](obm-chat.md) | [🔧](obm-chat.openapi.yaml) |
| **obm-analytics** 📊 | Analytics e relatórios | [📄](obm-analytics.md) | [🔧](obm-analytics.openapi.yaml) |
| **obm-search** 🔍 | Search e indexação | [📄](obm-search.md) | [🔧](obm-search.openapi.yaml) |
| **obm-files** 📁 | Armazenamento de arquivos | [📄](obm-files.md) | [🔧](obm-files.openapi.yaml) |
| **obm-telemetry** 📈 | Telemetry e observabilidade | [📄](obm-telemetry.md) | [🔧](obm-telemetry.openapi.yaml) |
| **obm-wallet** 💰 | Carteira digital e transações | [📄](obm-wallet.md) | [🔧](obm-wallet.openapi.yaml) |
| **obm-accounts** 👥 | Gestão de contas e perfis | [📄](obm-accounts.md) | [🔧](obm-accounts.openapi.yaml) |
| **obm-payments** 💳 | Pagamentos e transações | [📄](obm-payments.md) | [🔧](obm-payments.openapi.yaml) |
| **obm-notifications** 🔔 | Notificações e alertas | [📄](obm-notifications.md) | [🔧](obm-notifications.openapi.yaml) |

## Módulos de Conteúdo

| Módulo | Descrição | Documentação | OpenAPI |
|--------|-----------|--------------|---------|
| **obm-music-demos** 🎵 | Upload e gestão de demos musicais | [📄](obm-music-demos.md) | [🔧](obm-music-demos.openapi.yaml) |
| **obm-streaming** 🎬 | Streaming de áudio/vídeo | [📄](obm-streaming.md) | [🔧](obm-streaming.openapi.yaml) |
| **obm-nft-marketplace** 🧩 | Marketplace de NFTs | [📄](obm-nft-marketplace.md) | [🔧](obm-nft-marketplace.openapi.yaml) |

## Módulos de Administração

| Módulo | Descrição | Documentação | OpenAPI |
|--------|-----------|--------------|---------|
| **obm-billing** 💵 | Faturamento e invoices | [📄](obm-billing.md) | [🔧](obm-billing.openapi.yaml) |
| **obm-permissions** 🛡️ | RBAC e gestão de permissões | [📄](obm-permissions.md) | [🔧](obm-permissions.openapi.yaml) |

## SDKs Disponíveis

Todos os módulos possuem SDKs para facilitar a integração:

```bash
# Instalar SDKs específicos
npm install @obm/chat-sdk @obm/analytics-sdk @obm/payments-sdk

# Ou instalar o SDK principal com todos os módulos
npm install @obm/core-sdk
```

## Padrões de Integração

### Protocolo Orbit OBM
Todos os módulos seguem o [[00-Config/05-Protocolo-Orbit-OBM]]:

```json
{
  "status": "success",
  "data": { /* payload específico */ },
  "error": { /* opcional */ },
  "meta": {
    "version": "v1",
    "traceId": "uuid",
    "timestamp": "2024-01-01T00:00:00Z"
  }
}
```

### Headers Obrigatórios
- `X-Orbit-Trace-Id`: Rastreamento de requisições
- `X-Orbit-Version`: Versão da API
- `Authorization`: Token de autenticação

### Rate Limiting
- 1000 requisições por minuto por IP
- 100 requisições por minuto por token
- Headers de rate limit: `X-RateLimit-Limit`, `X-RateLimit-Remaining`, `X-RateLimit-Reset`

## Exemplos de Uso

### Chat (WebSocket)
```javascript
import { ChatClient } from '@obm/chat-sdk';

const chat = new ChatClient({
  url: 'wss://api.orbitbm.com/ws',
  token: 'seu-token-jwt'
});

await chat.connect();
chat.onMessage((message) => {
  console.log('Nova mensagem:', message);
});
```

### Analytics
```javascript
import { Analytics } from '@obm/analytics-sdk';

const analytics = new Analytics({
  apiKey: 'sua-api-key',
  projectId: 'seu-projeto'
});

analytics.track('user_signup', {
  userId: 'user_123',
  method: 'email'
});
```

### Payments
```javascript
import { Payments } from '@obm/payments-sdk';

const payments = new Payments({
  apiKey: 'sua-api-key'
});

const payment = await payments.create({
  amount: 1000,
  currency: 'BRL',
  method: 'credit_card',
  customerId: 'customer_123'
});
```

## Status dos Módulos

- ✅ **Produção**: Módulos core estáveis
- 🔄 **Beta**: Módulos em testes
- 🚧 **Desenvolvimento**: Módulos em construção
- 📋 **Planejado**: Módulos futuros

## Suporte

- Documentação: [[06-Glossario-Tecnico]]
- Issues: [GitHub Issues](https://github.com/orbitbm/obm/issues)
- Discord: [OrbitBM Community](https://discord.gg/orbitbm)
- Email: suporte@orbitbm.com