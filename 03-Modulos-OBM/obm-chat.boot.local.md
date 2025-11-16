# Boot Local - obm-chat 💬

## Pré-requisitos

```bash
# Node.js 18+ e npm
node --version  # >= 18.0.0
npm --version

# Docker e Docker Compose
docker --version
docker-compose --version

# Redis (para pub/sub)
# PostgreSQL (para persistência)
```

## Configuração Rápida

### 1. Clonar e Instalar
```bash
git clone https://github.com/orbitbm/obm-chat.git
cd obm-chat
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
DATABASE_URL=postgresql://user:pass@localhost:5432/obm_chat

# Redis
REDIS_URL=redis://localhost:6379

# Auth
JWT_SECRET=seu-jwt-secret-aqui
AUTH_SERVICE_URL=http://localhost:3001

# WebSocket
WS_PORT=8080
MAX_CONNECTIONS_PER_USER=5

# Rate Limiting
RATE_LIMIT_WINDOW_MS=60000
RATE_LIMIT_MAX_REQUESTS=100
```

### 3. Banco de Dados
```bash
# Criar banco de dados
createdb obm_chat

# Rodar migrações
npm run migrate

# Popular com dados de teste (opcional)
npm run seed
```

### 4. Iniciar Serviços

#### Modo Desenvolvimento
```bash
# Iniciar servidor de desenvolvimento
npm run dev

# Iniciar worker de processamento
npm run worker:dev

# Iniciar WebSocket server
npm run ws:dev
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

### WebSocket Connection
```bash
# Conectar via wscat
npm install -g wscat
wscat -c ws://localhost:8080/ws -H "Authorization: Bearer SEU_TOKEN"
```

### REST API
```bash
# Criar sala de chat
curl -X POST http://localhost:3000/api/chat/rooms \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer SEU_TOKEN" \
  -d '{"name": "Sala de Teste", "type": "group"}'

# Listar salas
curl -X GET http://localhost:3000/api/chat/rooms \
  -H "Authorization: Bearer SEU_TOKEN"

# Enviar mensagem (via REST - para teste)
curl -X POST http://localhost:3000/api/chat/messages \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer SEU_TOKEN" \
  -d '{"roomId": "room_123", "content": "Olá mundo!"}'
```

## Docker Compose Local

```yaml
version: '3.8'
services:
  postgres:
    image: postgres:15
    environment:
      POSTGRES_DB: obm_chat
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

  obm-chat:
    build: .
    ports:
      - "3000:3000"
      - "8080:8080"
    environment:
      - DATABASE_URL=postgresql://postgres:postgres@postgres:5432/obm_chat
      - REDIS_URL=redis://redis:6379
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
├── ws/            # WebSocket handlers
├── services/      # Lógica de negócio
├── models/        # Modelos de dados
├── middleware/    # Middlewares
├── utils/         # Utilitários
└── config/        # Configurações
```

### Scripts Disponíveis
```bash
npm run dev          # Desenvolvimento
npm run build        # Build produção
npm run start        # Iniciar produção
npm run test         # Testes
npm run test:watch   # Testes em watch mode
npm run migrate      # Migrações
npm run seed         # Popular dados
npm run lint         # Linting
npm run lint:fix     # Corrigir linting
```

### Debug
```bash
# Debug com Node Inspector
node --inspect-brk dist/server.js

# Logs detalhados
DEBUG=obm:* npm run dev

# Logs específicos
DEBUG=obm:chat,obm:ws npm run dev
```

## Health Check

```bash
# Verificar saúde do serviço
curl -X GET http://localhost:3000/health

# Verificar readiness
curl -X GET http://localhost:3000/ready

# Métricas (Prometheus)
curl -X GET http://localhost:3000/metrics
```

## Troubleshooting

### Problemas Comuns

1. **Porta já em uso**
   ```bash
   # Verificar processos
   lsof -i :3000
   lsof -i :8080
   
   # Matar processos
   kill -9 <PID>
   ```

2. **Conexão Redis falhando**
   ```bash
   # Verificar Redis
   redis-cli ping
   
   # Restart Redis
   brew services restart redis  # macOS
   sudo systemctl restart redis # Linux
   ```

3. **Migrações falhando**
   ```bash
   # Resetar banco
   npm run migrate:reset
   
   # Verificar status
   npm run migrate:status
   ```

4. **WebSocket não conecta**
   ```bash
   # Verificar logs
   tail -f logs/websocket.log
   
   # Testar conexão
   npm run test:ws
   ```

### Logs
```bash
# Ver todos os logs
tail -f logs/*.log

# Logs por serviço
tail -f logs/api.log
tail -f logs/ws.log
tail -f logs/worker.log
```

## Próximos Passos

1. Configurar [[03-Modulos-OBM/obm-auth]] para autenticação
2. Integrar com [[03-Modulos-OBM/obm-analytics]] para tracking
3. Configurar [[04-Stacks-e-Infra/09-Observabilidade]]
4. Verificar [[00-Config/07-Catalogo-de-Erros]]

## Suporte

- Documentação: [[03-Modulos-OBM/obm-chat]]
- Issues: [GitHub Issues](https://github.com/orbitbm/obm-chat/issues)
- Discord: [#chat-support](https://discord.gg/orbitbm)

---
**Status**: ✅ Produção | **Versão**: 1.0.0 | **Última Atualização**: 2024-01-15