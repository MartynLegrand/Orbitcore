# Checklist: R18 - Modularização (Modelo Martyn) 🏗️

> **Regra:** 18
> **Categoria:** Arquitetura
> **Prioridade:** CRÍTICA
> **Baseado em:** [[00-Config/03-RULES-GLOBAL#18]] e [[00-Config/05-Modelo-Modularizacao]]

## Visão Geral da Regra

**Princípio:** Todo módulo OBM deve seguir estrutura padronizada com responsabilidade única, API clara e documentação completa.

**Objetivo:** Garantir módulos consistentes, reutilizáveis e fáceis de manter.

---

## Checklist Completo (20+ items)

### 1. Estrutura de Arquivos Obrigatória

#### 1.1 Diretório Raiz
- [ ] `/service/` - Backend implementation presente
- [ ] `/sdk-js/` - SDK JavaScript/TypeScript presente
- [ ] `/sdk-py/` - SDK Python presente (ou N/A justificado)
- [ ] `/docs/` - Documentação completa presente
- [ ] `README.md` - Presente na raiz do módulo

**Estrutura esperada:**
```
modules/obm-[nome]/
├── service/
├── sdk-js/
├── sdk-py/
├── docs/
└── README.md
```

---

#### 1.2 Service (Backend)
- [ ] `/service/src/` - Código fonte
- [ ] `/service/tests/` - Testes
- [ ] `/service/Dockerfile` - Container
- [ ] `/service/package.json` ou `/service/requirements.txt` - Dependências
- [ ] `/service/.env.example` - Variáveis de ambiente documentadas
- [ ] `/service/README.md` - Instruções específicas do service

**Estrutura interna (NestJS exemplo):**
```
service/
├── src/
│   ├── main.ts
│   ├── app.module.ts
│   ├── [module]/
│   │   ├── [module].module.ts
│   │   ├── [module].controller.ts
│   │   ├── [module].service.ts
│   │   ├── dto/
│   │   ├── entities/
│   │   └── interfaces/
│   └── common/
│       ├── filters/
│       ├── guards/
│       ├── interceptors/
│       └── pipes/
├── tests/
│   ├── unit/
│   └── integration/
├── Dockerfile
├── package.json
├── tsconfig.json
└── README.md
```

---

#### 1.3 SDK JavaScript/TypeScript
- [ ] `/sdk-js/src/` - Código fonte do SDK
- [ ] `/sdk-js/tests/` - Testes do SDK
- [ ] `/sdk-js/package.json` - Configuração npm
- [ ] `/sdk-js/tsconfig.json` - Configuração TypeScript
- [ ] `/sdk-js/README.md` - Instruções de uso

**Estrutura:**
```
sdk-js/
├── src/
│   ├── index.ts
│   ├── client.ts
│   ├── types.ts
│   └── errors.ts
├── tests/
│   └── client.spec.ts
├── package.json
├── tsconfig.json
└── README.md
```

---

#### 1.4 SDK Python
- [ ] `/sdk-py/src/` - Código fonte do SDK
- [ ] `/sdk-py/tests/` - Testes do SDK
- [ ] `/sdk-py/setup.py` ou `/sdk-py/pyproject.toml` - Configuração
- [ ] `/sdk-py/README.md` - Instruções de uso

**Estrutura:**
```
sdk-py/
├── src/
│   └── obm_[nome]/
│       ├── __init__.py
│       ├── client.py
│       ├── types.py
│       └── errors.py
├── tests/
│   └── test_client.py
├── setup.py
├── requirements.txt
└── README.md
```

---

#### 1.5 Documentação
- [ ] `/docs/01-Visao-Geral.md` - Overview conceitual
- [ ] `/docs/02-Integracao.md` - Como integrar
- [ ] `/docs/03-API-Reference.md` - Documentação de endpoints
- [ ] `/docs/04-SDK-Usage.md` - Exemplos de uso dos SDKs
- [ ] `/docs/05-Deployment.md` - Como deployar (opcional mas recomendado)

---

### 2. Responsabilidade Única

#### 2.1 Definição Clara
- [ ] Módulo tem uma responsabilidade bem definida
- [ ] Escopo não ultrapassa responsabilidade
- [ ] Nome do módulo reflete responsabilidade

**Exemplos válidos:**
- `obm-auth` - Apenas autenticação/autorização
- `obm-billing` - Apenas pagamentos/assinaturas
- `obm-chat` - Apenas mensagens em tempo real

**Exemplos inválidos:**
- `obm-everything` - Faz tudo (viola princípio)
- `obm-user-and-payments` - Duas responsabilidades

---

#### 2.2 Coesão
- [ ] Funcionalidades do módulo são coesas
- [ ] Código relacionado está junto
- [ ] Sem código não relacionado à responsabilidade

---

### 3. API Clara

#### 3.1 Endpoints Documentados
- [ ] Todos os endpoints listados
- [ ] Métodos HTTP especificados (GET, POST, PUT, DELETE)
- [ ] Request/Response schemas definidos
- [ ] Códigos de erro documentados

**Exemplo (OpenAPI/Swagger):**
```yaml
/auth/login:
  post:
    summary: User login
    requestBody:
      required: true
      content:
        application/json:
          schema:
            type: object
            properties:
              email:
                type: string
              password:
                type: string
    responses:
      200:
        description: Success
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/AuthResponse'
      401:
        description: Unauthorized
```

---

#### 3.2 DTOs/Schemas Tipados
- [ ] Inputs validados com DTOs (TypeScript) ou Models (Pydantic)
- [ ] Outputs tipados
- [ ] Validações especificadas

**Exemplo TypeScript:**
```typescript
export class LoginDTO {
  @IsEmail()
  email: string;

  @IsString()
  @MinLength(8)
  password: string;
}
```

**Exemplo Python:**
```python
from pydantic import BaseModel, EmailStr

class LoginDTO(BaseModel):
    email: EmailStr
    password: str
```

---

#### 3.3 Códigos de Erro Padronizados
- [ ] Códigos HTTP apropriados (200, 201, 400, 401, 404, 500)
- [ ] Mensagens de erro consistentes
- [ ] Estrutura de erro padronizada

**Exemplo:**
```json
{
  "statusCode": 400,
  "message": "Validation failed",
  "errors": [
    {
      "field": "email",
      "message": "Email is invalid"
    }
  ]
}
```

---

### 4. SDKs Disponíveis

#### 4.1 SDK JavaScript/TypeScript
- [ ] Cliente com métodos para todas as APIs
- [ ] Tipagens TypeScript completas
- [ ] Tratamento de erros
- [ ] Exemplos de uso no README

**Exemplo:**
```typescript
import { AuthClient } from '@obm/auth-sdk-js';

const client = new AuthClient({
  baseURL: 'https://api.example.com'
});

const { token } = await client.login({
  email: 'user@example.com',
  password: 'password123'
});
```

---

#### 4.2 SDK Python
- [ ] Cliente com métodos para todas as APIs
- [ ] Type hints completos
- [ ] Tratamento de erros
- [ ] Exemplos de uso no README

**Exemplo:**
```python
from obm_auth import AuthClient

client = AuthClient(base_url='https://api.example.com')

response = client.login(
    email='user@example.com',
    password='password123'
)
print(response.token)
```

---

### 5. Testes

#### 5.1 Cobertura Mínima
- [ ] Coverage > 80% (requisito mínimo)
- [ ] Coverage > 90% (recomendado)
- [ ] Relatório de coverage gerado

**Comando:**
```bash
npm test -- --coverage
# ou
pytest --cov=src --cov-report=html
```

---

#### 5.2 Tipos de Testes
- [ ] **Testes Unitários** - Service, repository, helpers
- [ ] **Testes de Integração** - Controller + Service + Database
- [ ] **Testes E2E** - Fluxo completo via HTTP

**Exemplo estrutura:**
```
tests/
├── unit/
│   ├── service.spec.ts
│   └── repository.spec.ts
├── integration/
│   └── controller.spec.ts
└── e2e/
    └── auth-flow.e2e.spec.ts
```

---

#### 5.3 Mocks Apropriados
- [ ] Dependências externas mockadas
- [ ] Database mockado em testes unitários
- [ ] HTTP calls mockados quando necessário

---

### 6. Observabilidade

#### 6.1 Logs Estruturados
- [ ] Logs em formato JSON
- [ ] Níveis apropriados (debug, info, warn, error)
- [ ] Context IDs para tracing
- [ ] Sem dados sensíveis nos logs

**Exemplo:**
```typescript
this.logger.log({
  level: 'info',
  message: 'User logged in',
  userId: user.id,
  timestamp: new Date().toISOString(),
  contextId: request.id
});
```

---

#### 6.2 Métricas
- [ ] Endpoint `/metrics` exposto
- [ ] Métricas Prometheus implementadas
- [ ] Request duration, rate, error rate

**Exemplo (NestJS):**
```typescript
@Get('/metrics')
getMetrics() {
  return this.prometheusService.getMetrics();
}
```

---

#### 6.3 Health Checks
- [ ] Endpoint `/health` implementado
- [ ] Status de dependências (DB, Redis, etc.)
- [ ] Timeout configurado

**Exemplo resposta:**
```json
{
  "status": "ok",
  "version": "1.2.0",
  "uptime": 3600,
  "dependencies": {
    "database": "ok",
    "redis": "ok"
  }
}
```

---

#### 6.4 Tracing Distribuído
- [ ] OpenTelemetry ou Jaeger configurado
- [ ] Trace IDs propagados
- [ ] Spans criados para operações importantes

---

### 7. Deploy e Infraestrutura

#### 7.1 Docker
- [ ] `Dockerfile` otimizado (multi-stage build)
- [ ] `docker-compose.yml` para desenvolvimento local
- [ ] Imagem < 500MB (recomendado)
- [ ] Health check no Docker

**Exemplo Dockerfile:**
```dockerfile
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
EXPOSE 3000
CMD ["node", "dist/main.js"]
```

---

#### 7.2 Helm Chart (K8s)
- [ ] Chart configurado (se deploy em K8s)
- [ ] ConfigMaps e Secrets separados
- [ ] Resources (CPU, memory) definidos
- [ ] Liveness e Readiness probes configurados

---

#### 7.3 CI/CD
- [ ] Pipeline configurado
- [ ] Testes rodam automaticamente
- [ ] Build de imagem Docker
- [ ] Deploy automatizado

---

### 8. Documentação Completa

#### 8.1 README Principal
- [ ] Overview do módulo
- [ ] Quick start (< 5 minutos)
- [ ] Requisitos (Node, Python, Docker, etc.)
- [ ] Como instalar
- [ ] Variáveis de ambiente
- [ ] Como rodar testes
- [ ] Como contribuir

---

#### 8.2 API Reference
- [ ] Todos os endpoints documentados
- [ ] Request/Response examples
- [ ] Códigos de erro
- [ ] Autenticação explicada

---

#### 8.3 SDK Usage
- [ ] Instalação do SDK
- [ ] Inicialização do cliente
- [ ] Exemplos de uso por funcionalidade
- [ ] Tratamento de erros

---

#### 8.4 CHANGELOG
- [ ] Arquivo `CHANGELOG.md` presente
- [ ] Versionamento semântico (SemVer)
- [ ] Mudanças documentadas por versão

**Formato:**
```markdown
## [1.2.0] - 2025-11-16

### Added
- OAuth support (Google, GitHub)
- Rate limiting on all endpoints

### Changed
- JWT expiration from 1h to 24h

### Fixed
- Memory leak in WebSocket connections
```

---

### 9. Segurança

#### 9.1 Secrets
- [ ] Secrets via environment variables
- [ ] `.env.example` documenta todas as vars
- [ ] Nunca hardcoded no código

---

#### 9.2 Validação
- [ ] Inputs validados com DTOs/schemas
- [ ] Sanitização de dados quando necessário
- [ ] SQL injection prevention (ORM)
- [ ] XSS prevention (sanitização)

---

#### 9.3 Autenticação/Autorização
- [ ] Autenticação implementada (se aplicável)
- [ ] Guards configurados (NestJS) ou Middleware (FastAPI)
- [ ] RBAC implementado (se necessário)

---

#### 9.4 Rate Limiting
- [ ] Rate limiting configurado
- [ ] Limites apropriados definidos
- [ ] Respostas 429 Too Many Requests

---

### 10. Performance

#### 10.1 Cache
- [ ] Cache implementado onde apropriado (Redis)
- [ ] TTL configurado
- [ ] Cache invalidation estratégia definida

---

#### 10.2 Queries Otimizadas
- [ ] Índices de database criados
- [ ] N+1 queries evitados
- [ ] Paginação implementada em listagens

---

#### 10.3 Benchmarks
- [ ] Response time < 100ms (p50) para operações simples
- [ ] Response time < 500ms (p95)
- [ ] Throughput adequado para escala esperada

---

## Score de Compliance

### Cálculo por Categoria:

**1. Estrutura (10 items):**
- Items completos: [X/10]
- Score: [X/10 * 100]%

**2. Responsabilidade (3 items):**
- Items completos: [X/3]
- Score: [X/3 * 100]%

**3. API (3 items):**
- Items completos: [X/3]
- Score: [X/3 * 100]%

**4. SDKs (2 items):**
- Items completos: [X/2]
- Score: [X/2 * 100]%

**5. Testes (3 items):**
- Items completos: [X/3]
- Score: [X/3 * 100]%

**6. Observabilidade (4 items):**
- Items completos: [X/4]
- Score: [X/4 * 100]%

**7. Deploy (3 items):**
- Items completos: [X/3]
- Score: [X/3 * 100]%

**8. Documentação (4 items):**
- Items completos: [X/4]
- Score: [X/4 * 100]%

**9. Segurança (4 items):**
- Items completos: [X/4]
- Score: [X/4 * 100]%

**10. Performance (3 items):**
- Items completos: [X/3]
- Score: [X/3 * 100]%

### Score Total:
**Items validados:** [X/39]
**Score:** [X/39 * 100]%

### Requisitos:
- ✅ **Mínimo:** 80% (32/39 items)
- ⭐ **Recomendado:** 90% (36/39 items)
- 🏆 **Excelente:** 100% (39/39 items)

---

## Gaps Comuns

### Gap 1: SDK Python Ausente
**Frequência:** Alta
**Ação:** Criar SDK Python ou justificar por que não é necessário

### Gap 2: Coverage < 80%
**Frequência:** Média
**Ação:** Adicionar testes até atingir mínimo

### Gap 3: Health Check Não Implementado
**Frequência:** Média
**Ação:** Implementar endpoint `/health`

### Gap 4: Documentação Incompleta
**Frequência:** Alta
**Ação:** Completar docs faltantes (API Reference, SDK Usage)

### Gap 5: Sem Observabilidade
**Frequência:** Baixa
**Ação:** Implementar logs estruturados, métricas, health checks

---

## Validação Rápida (5 minutos)

**Checklist mínimo:**
- [ ] Estrutura de arquivos presente (service/ sdk-js/ docs/)
- [ ] README com quick start
- [ ] Testes > 80% coverage
- [ ] Dockerfile presente
- [ ] Health check `/health` funcionando
- [ ] API documentada (Swagger/OpenAPI)

**Se todos ✅:** Módulo passa validação básica.
**Se algum ❌:** Módulo requer trabalho adicional.

---

## Ferramentas de Validação

### Script Automático:
```bash
#!/bin/bash
# validate-module.sh

MODULE=$1

echo "Validating $MODULE..."

# Check structure
test -d "$MODULE/service" || echo "❌ Missing service/"
test -d "$MODULE/sdk-js" || echo "❌ Missing sdk-js/"
test -d "$MODULE/docs" || echo "❌ Missing docs/"

# Check files
test -f "$MODULE/README.md" || echo "❌ Missing README.md"
test -f "$MODULE/service/Dockerfile" || echo "❌ Missing Dockerfile"

# Check tests
cd "$MODULE/service"
npm test -- --coverage --coverageThreshold='{"global":{"statements":80}}'

echo "✅ Validation complete"
```

---

## Referências

- [[00-Config/05-Modelo-Modularizacao]] - Modelo completo com exemplos
- [[00-Config/03-RULES-GLOBAL#18]] - Definição da regra
- [[07-Receitas-e-Playbooks/06-Checklist-Validacao-Modulo]] - Checklist expandido
- [[03-Modulos-OBM]] - Exemplos de módulos conformes

---

> [!success] Módulo Conforme
> Se todos os 39+ items estão ✅, o módulo está 100% conforme com R18.

**Módulo:** [Nome]
**Verificado em:** [YYYY-MM-DD]
**Verificado por:** [Nome]
**Score:** [X]%
**Status:** ✅ Aprovado / ⚠️ Com ressalvas / ❌ Requer trabalho
