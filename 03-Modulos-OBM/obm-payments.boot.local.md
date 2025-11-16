# Boot Local - obm-payments 💳

## Pré-requisitos

```bash
# Node.js 18+ e npm
node --version  # >= 18.0.0
npm --version

# Docker e Docker Compose
docker --version
docker-compose --version

# Redis (para rate limiting e cache)
# PostgreSQL (para transações)
# Stripe CLI (para webhooks locais)
```

## Configuração Rápida

### 1. Clonar e Instalar
```bash
git clone https://github.com/orbitbm/obm-payments.git
cd obm-payments
npm install
```

### 2. Configurar Variáveis de Ambiente
```bash
# Copiar arquivo de exemplo
cp .env.example .env

# Editar configurações necessárias
nano .env
```

**Variáveis Obrigatórias:**
```env
# Banco de Dados
DATABASE_URL=postgresql://user:pass@localhost:5432/obm_payments

# Redis
REDIS_URL=redis://localhost:6379

# Providers de Pagamento
STRIPE_SECRET_KEY=sk_test_...
STRIPE_WEBHOOK_SECRET=whsec_...
MERCADO_PAGO_ACCESS_TOKEN=TEST-...
PAGARME_API_KEY=ak_test_...

# Auth
JWT_SECRET=seu-jwt-secret-aqui
AUTH_SERVICE_URL=http://localhost:3001

# Configurações de Pagamento
PAYMENT_TIMEOUT_MS=300000
MAX_PAYMENT_AMOUNT=100000
CURRENCIES_SUPPORTED=BRL,USD,EUR

# Webhook
WEBHOOK_SECRET=seu-webhook-secret
WEBHOOK_TIMEOUT_MS=30000
```

### 3. Banco de Dados
```bash
# Criar banco de dados
createdb obm_payments

# Rodar migrações
npm run migrate

# Popular com métodos de pagamento (opcional)
npm run seed:payment-methods
```

### 4. Iniciar Serviços

#### Modo Desenvolvimento
```bash
# Iniciar servidor de desenvolvimento
npm run dev

# Iniciar worker de processamento
npm run worker:dev

# Iniciar listener de webhooks
npm run webhook:dev
```

#### Modo Produção Local
```bash
# Build
npm run build

# Iniciar todos os serviços
npm start

# Ou usar Docker
docker-compose up -d
```

## Testar a API

### Criar Pagamento
```bash
# Criar pagamento com cartão
curl -X POST http://localhost:3000/api/payments \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer SEU_TOKEN" \
  -d '{
    "amount": 1000,
    "currency": "BRL",
    "method": "credit_card",
    "customerId": "customer_123",
    "card": {
      "number": "4111111111111111",
      "holderName": "Test User",
      "expiryMonth": 12,
      "expiryYear": 2025,
      "cvv": "123"
    }
  }'

# Criar pagamento com PIX
curl -X POST http://localhost:3000/api/payments \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer SEU_TOKEN" \
  -d '{
    "amount": 1000,
    "currency": "BRL",
    "method": "pix",
    "customerId": "customer_123"
  }'
```

### Consultar Pagamento
```bash
# Buscar por ID
curl -X GET http://localhost:3000/api/payments/pay_123 \
  -H "Authorization: Bearer SEU_TOKEN"

# Listar pagamentos
curl -X GET "http://localhost:3000/api/payments?customerId=customer_123&page=1" \
  -H "Authorization: Bearer SEU_TOKEN"
```

### Reembolsar
```bash
curl -X POST http://localhost:3000/api/payments/pay_123/refund \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer SEU_TOKEN" \
  -d '{"amount": 500, "reason": "customer_request"}'
```

## Docker Compose Local

```yaml
version: '3.8'
services:
  postgres:
    image: postgres:15
    environment:
      POSTGRES_DB: obm_payments
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"

  stripe-cli:
    image: stripe/stripe-cli:latest
    command: listen --api-key ${STRIPE_SECRET_KEY} --forward-to obm-payments:3000/webhooks/stripe
    environment:
      - STRIPE_API_KEY=${STRIPE_SECRET_KEY}
    depends_on:
      - obm-payments

  obm-payments:
    build: .
    ports:
      - "3000:3000"
    environment:
      - DATABASE_URL=postgresql://postgres:postgres@postgres:5432/obm_payments
      - REDIS_URL=redis://redis:6379
      - STRIPE_SECRET_KEY=${STRIPE_SECRET_KEY}
      - STRIPE_WEBHOOK_SECRET=${STRIPE_WEBHOOK_SECRET}
    depends_on:
      - postgres
      - redis
    volumes:
      - .:/app
      - /app/node_modules

volumes:
  postgres_data:
```

## Desenvolvimento

### Estrutura do Projeto
```
src/
├── api/           # REST API endpoints
├── services/      # Lógica de pagamento por provider
├── workers/       # Processamento assíncrono
├── models/        # Modelos de dados
├── webhooks/      # Handlers de webhooks
├── middleware/    # Middlewares
├── utils/         # Utilitários
└── config/        # Configurações
```

### Scripts Disponíveis
```bash
npm run dev              # Desenvolvimento
npm run build            # Build produção
npm run start            # Iniciar produção
npm run test             # Testes
npm run test:integration  # Testes de integração
npm run migrate          # Migrações
npm run seed:payment-methods # Popular métodos
npm run lint             # Linting
npm run lint:fix         # Corrigir linting
```

### Test Cards e Dados

#### Cartões de Teste
```
# Visa (Aprovado)
4111111111111111

# Mastercard (Aprovado)
5555555555554444

# Visa (Recusado)
4000000000000002

# Cartão com 3D Secure
4000000000003220
```

#### Chaves PIX de Teste
```
# CPF Válido
+5511999999999

# CNPJ Válido
12345678901234

# Email Válido
teste@orbitbm.com

# Chave Aleatória
123e4567-e89b-12d3-a456-426614174000
```

### Debug
```bash
# Debug com Node Inspector
node --inspect-brk dist/server.js

# Logs detalhados
DEBUG=obm:* npm run dev

# Logs específicos
DEBUG=obm:payments,obm:webhooks npm run dev
```

## Health Check

```bash
# Verificar saúde do serviço
curl -X GET http://localhost:3000/health

# Verificar readiness
curl -X GET http://localhost:3000/ready

# Verificar providers
curl -X GET http://localhost:3000/health/providers

# Métricas (Prometheus)
curl -X GET http://localhost:3000/metrics
```

## Webhooks Locais

### Configurar Stripe CLI
```bash
# Instalar Stripe CLI
brew install stripe/stripe-cli/stripe

# Login
stripe login

# Forward webhooks
stripe listen --forward-to localhost:3000/webhooks/stripe
```

### Testar Webhook
```bash
# Disparar evento de teste
stripe trigger payment_intent.succeeded
```

## Troubleshooting

### Problemas Comuns

1. **Provider não responde**
   ```bash
   # Verificar chaves de API
   echo $STRIPE_SECRET_KEY
   
   # Testar conexão
   curl https://api.stripe.com/v1/charges \
     -u $STRIPE_SECRET_KEY:
   ```

2. **Webhook falhando**
   ```bash
   # Verificar logs
   tail -f logs/webhook.log
   
   # Testar endpoint
   curl -X POST localhost:3000/webhooks/stripe \
     -H "Content-Type: application/json" \
     -d '{"type":"test"}'
   ```

3. **Pagamento pendente infinitamente**
   ```bash
   # Verificar workers
   npm run worker:status
   
   # Forçar processamento
   npm run process:pending
   ```

4. **Redis connection failed**
   ```bash
   # Verificar Redis
   redis-cli ping
   
   # Restart Redis
   brew services restart redis  # macOS
   sudo systemctl restart redis # Linux
   ```

### Logs
```bash
# Ver todos os logs
tail -f logs/*.log

# Logs por serviço
tail -f logs/api.log
tail -f logs/worker.log
tail -f logs/webhook.log
tail -f logs/payment-processing.log
```

## Segurança

### Dados Sensíveis
- Nunca logar números de cartão completos
- Usar tokenização quando possível
- Implementar rate limiting por IP e user
- Validar todos os inputs

### Certificados PCI
- Usar Stripe/MercadoPago para reduzir escopo PCI
- Nunca armazenar CVV
- Criptografar dados em repouso
- Implementar audit logging

## Próximos Passos

1. Configurar [[03-Modulos-OBM/obm-billing]] para faturamento
2. Integrar com [[03-Modulos-OBM/obm-analytics]] para métricas
3. Configurar [[04-Stacks-e-Infra/09-Observabilidade]]
4. Verificar [[00-Config/07-Catalogo-de-Erros]]

## Suporte

- Documentação: [[03-Modulos-OBM/obm-payments]]
- Issues: [GitHub Issues](https://github.com/orbitbm/obm-payments/issues)
- Discord: [#payments-support](https://discord.gg/orbitbm)
- Email: suporte@orbitbm.com

---
**Status**: ✅ Produção | **Versão**: 1.0.0 | **Última Atualização**: 2024-01-15