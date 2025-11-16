# Starter Funcional - OBM Chat 💬

Este é um starter funcional mínimo para o módulo `obm-chat` com todas as funcionalidades básicas implementadas.

## 🚀 Começando

### 1. Instalação
```bash
npx create-obm-starter chat my-chat-app
cd my-chat-app
npm install
```

### 2. Configuração Rápida
```bash
# Copiar configurações
cp .env.example .env

# Iniciar banco de dados com Docker
docker-compose up -d postgres redis

# Rodar migrações
npm run migrate:dev

# Popular dados de exemplo
npm run seed
```

### 3. Iniciar Desenvolvimento
```bash
npm run dev
```

Acesse: http://localhost:3000

## 📁 Estrutura do Projeto

```
my-chat-app/
├── src/
│   ├── api/
│   │   ├── routes/
│   │   │   ├── auth.routes.ts
│   │   │   ├── chat.routes.ts
│   │   │   └── rooms.routes.ts
│   │   ├── middleware/
│   │   │   ├── auth.middleware.ts
│   │   │   ├── error.middleware.ts
│   │   │   └── validation.middleware.ts
│   │   └── controllers/
│   │       ├── auth.controller.ts
│   │       ├── chat.controller.ts
│   │       └── rooms.controller.ts
│   ├── services/
│   │   ├── auth.service.ts
│   │   ├── chat.service.ts
│   │   ├── rooms.service.ts
│   │   └── websocket.service.ts
│   ├── models/
│   │   ├── user.model.ts
│   │   ├── message.model.ts
│   │   └── room.model.ts
│   ├── websocket/
│   │   ├── handlers/
│   │   │   ├── connection.handler.ts
│   │   │   ├── message.handler.ts
│   │   │   └── room.handler.ts
│   │   └── websocket.server.ts
│   ├── database/
│   │   ├── connection.ts
│   │   ├── migrations/
│   │   └── seeders/
│   ├── config/
│   │   ├── index.ts
│   │   ├── database.ts
│   │   ├── redis.ts
│   │   └── websocket.ts
│   ├── utils/
│   │   ├── logger.ts
│   │   ├── validators.ts
│   │   └── helpers.ts
│   └── types/
│       ├── user.types.ts
│       ├── message.types.ts
│       └── room.types.ts
├── public/
│   ├── index.html
│   ├── css/
│   └── js/
├── tests/
│   ├── unit/
│   ├── integration/
│   └── e2e/
├── docker/
│   ├── Dockerfile
│   └── docker-compose.yml
├── .env.example
├── package.json
├── tsconfig.json
├── jest.config.js
└── README.md
```

## 🔧 Funcionalidades Implementadas

### ✅ Core Features
- [x] Autenticação JWT
- [x] Criação de salas de chat
- [x] Mensagens em tempo real via WebSocket
- [x] Histórico de mensagens
- [x] Presença online
- [x] Typing indicators
- [x] Notificações de novas mensagens

### ✅ API REST
- [x] POST /api/auth/register - Registro de usuários
- [x] POST /api/auth/login - Login
- [x] GET /api/rooms - Listar salas
- [x] POST /api/rooms - Criar sala
- [x] GET /api/rooms/:id/messages - Histórico
- [x] GET /api/users/me - Perfil do usuário

### ✅ WebSocket Events
- [x] `connection` - Conexão estabelecida
- [x] `join-room` - Entrar em sala
- [x] `leave-room` - Sair da sala
- [x] `send-message` - Enviar mensagem
- [x] `typing-start` - Começar a digitar
- [x] `typing-stop` - Parar de digitar
- [x] `user-joined` - Usuário entrou
- [x] `user-left` - Usuário saiu
- [x] `new-message` - Nova mensagem
- [x] `user-typing` - Usuário digitando

### ✅ Segurança
- [x] Rate limiting
- [x] Input validation
- [x] SQL injection protection
- [x] XSS protection
- [x] CORS configurado
- [x] Helmet.js
- [x] Winston logger

### ✅ Banco de Dados
- [x] PostgreSQL com Prisma ORM
- [x] Redis para cache e sessões
- [x] Migrations automáticas
- [x] Seeders para dados de teste

## 📝 Exemplos de Uso

### Criar Usuário
```bash
curl -X POST http://localhost:3000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john@example.com",
    "password": "123456"
  }'
```

### Login
```bash
curl -X POST http://localhost:3000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "john@example.com",
    "password": "123456"
  }'
```

### Criar Sala
```bash
curl -X POST http://localhost:3000/api/rooms \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer SEU_TOKEN" \
  -d '{
    "name": "General Chat",
    "description": "Main discussion room"
  }'
```

### WebSocket Client Example
```javascript
// Conectar ao WebSocket
const socket = io('http://localhost:3000', {
  auth: {
    token: 'SEU_JWT_TOKEN'
  }
});

// Entrar em uma sala
socket.emit('join-room', {
  roomId: 'room_123'
});

// Enviar mensagem
socket.emit('send-message', {
  roomId: 'room_123',
  content: 'Hello everyone!'
});

// Escutar mensagens
socket.on('new-message', (data) => {
  console.log('New message:', data);
});

// Indicar que está digitando
socket.emit('typing-start', {
  roomId: 'room_123'
});
```

## 🧪 Testes

```bash
# Testes unitários
npm run test

# Testes de integração
npm run test:integration

# Testes E2E
npm run test:e2e

# Test coverage
npm run test:coverage
```

## 🐳 Docker

```bash
# Build da imagem
docker build -t my-chat-app .

# Rodar com Docker Compose
docker-compose up -d

# Ver logs
docker-compose logs -f
```

## 📊 Monitoramento

### Health Check
```bash
curl http://localhost:3000/health
```

### Métricas (Prometheus)
```bash
curl http://localhost:3000/metrics
```

### Logs
```bash
# Ver logs em tempo real
npm run logs

# Logs por nível
npm run logs:error
npm run logs:warn
npm run logs:info
```

## 🔧 Configuração

### Variáveis de Ambiente
```env
# Server
PORT=3000
NODE_ENV=development

# Database
DATABASE_URL=postgresql://user:pass@localhost:5432/chat_db

# Redis
REDIS_URL=redis://localhost:6379

# JWT
JWT_SECRET=your-super-secret-jwt-key
JWT_EXPIRES_IN=7d

# WebSocket
WS_PORT=3001
MAX_CONNECTIONS_PER_USER=5

# Rate Limiting
RATE_LIMIT_WINDOW_MS=60000
RATE_LIMIT_MAX_REQUESTS=100

# CORS
CORS_ORIGIN=http://localhost:3000

# Logging
LOG_LEVEL=info
LOG_FILE=logs/app.log
```

## 🚀 Deployment

### Produção
```bash
# Build para produção
npm run build

# Iniciar em modo produção
npm start

# Com PM2
pm2 start ecosystem.config.js
```

### Ambientes
- **Development**: `npm run dev`
- **Staging**: `npm run start:staging`
- **Production**: `npm start`

## 📚 Documentação Adicional

- [API Documentation](docs/api.md)
- [WebSocket Events](docs/websocket.md)
- [Deployment Guide](docs/deployment.md)
- [Contributing](CONTRIBUTING.md)

## 🤝 Contribuindo

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/amazing-feature`)
3. Commit suas mudanças (`git commit -m 'Add some amazing feature'`)
4. Push para a branch (`git push origin feature/amazing-feature`)
5. Abra um Pull Request

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 🆘 Suporte

- **Issues**: [GitHub Issues](https://github.com/your-org/my-chat-app/issues)
- **Discord**: [Join our server](https://discord.gg/your-server)
- **Email**: support@yourproject.com

---

**Feito com ❤️ pela equipe OrbitBM**