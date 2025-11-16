# HANDOFF: [TASK ID] - [De Agent X para Agent Y]

> **De:** [Agent origem - ex: Architect]
> **Para:** [Agent destino - ex: Codex Dev]
> **Data:** [YYYY-MM-DD]
> **Task:** [Nome/ID da task]

---

## 1. Contexto e Objetivo

**O que foi solicitado:**
[Resumo claro da task original]

**Objetivo desta entrega:**
[O que este handoff está passando adiante]

**Fase atual:** [ANÁLISE / PLANO / EXECUÇÃO / REVIEW]

---

## 2. Entregáveis Prontos

### Documentos Criados:
- [x] `docs/[task-id]/ANALISE.md` - Análise completa
- [x] `docs/[task-id]/PLANO.md` - Plano de implementação
- [x] `docs/[task-id]/ARCHITECTURE.md` - Diagramas e decisões
- [ ] [Outros documentos se aplicável]

**Localização:** `[path/to/documents]`

---

### Artefatos Gerados:
- [x] Diagramas de arquitetura (Mermaid)
- [x] Especificações de API (OpenAPI)
- [x] Modelo de dados (ER Diagram)
- [x] Checklist de implementação

---

## 3. Decisões Tomadas

### Decisão 1: [Nome da Decisão]
**Contexto:** [Por que esta decisão foi necessária]
**Opções consideradas:** [A, B, C]
**Escolha:** [Opção X]
**Justificativa:** [Por que esta opção]
**Impacto:** [Consequências desta escolha]

---

### Decisão 2: [Nome da Decisão]
**Contexto:** [Por que esta decisão foi necessária]
**Opções consideradas:** [A, B, C]
**Escolha:** [Opção X]
**Justificativa:** [Por que esta opção]
**Impacto:** [Consequências desta escolha]

---

## 4. Stack Técnica Definida

### Backend:
- **Framework:** [NestJS / FastAPI]
- **Database:** [Postgres / MongoDB / etc]
- **ORM:** [Prisma / TypeORM]
- **Cache:** [Redis]
- **Queue:** [BullMQ]

### Frontend (se aplicável):
- **Framework:** [Next.js / React]
- **State:** [Redux / Zustand / Context]
- **Styling:** [Tailwind / Styled Components]

### Infraestrutura:
- **Container:** [Docker]
- **Orchestration:** [Docker Compose / K8s]
- **Deploy:** [Vercel / Railway / AWS]

---

## 5. Dependências e Pré-requisitos

### Bibliotecas/Packages:
```json
{
  "dependencies": {
    "package-1": "^1.2.3",
    "package-2": "^2.0.0"
  }
}
```

**Licenças verificadas:** ✅ Todas MIT/Apache/BSD

---

### Serviços Externos:
- **[Nome do serviço]** (ex: Stripe, Twilio)
  - Credenciais: [Onde obter]
  - Documentação: [Link]
  - Rate limits: [Informação]

---

### Infraestrutura:
- **Redis:** Disponível em `localhost:6379` (dev) / `redis:6379` (docker)
- **Postgres:** Disponível em `localhost:5432` (dev) / `postgres:5432` (docker)
- **S3/Storage:** [Configuração necessária]

---

## 6. Checklist de Implementação

**Total de tasks:** X
**Estimativa:** Y horas

### Fase 1: Setup (X horas)
- [ ] Criar estrutura de arquivos
- [ ] Configurar módulo
- [ ] Instalar dependências
- [ ] Criar entidades/models

### Fase 2: Core (Y horas)
- [ ] Implementar controller
- [ ] Implementar service
- [ ] Implementar repository
- [ ] Criar DTOs

### Fase 3: Integrações (Z horas)
- [ ] Integrar [serviço externo]
- [ ] Configurar cache
- [ ] Configurar fila

### Fase 4: Testes (W horas)
- [ ] Testes unitários
- [ ] Testes de integração
- [ ] Coverage > 80%

### Fase 5: Docs (K horas)
- [ ] README
- [ ] API docs
- [ ] CHANGELOG

---

## 7. Arquivos a Criar/Modificar

### Arquivos Novos:
```
modules/[name]/
  service/
    src/
      [name].module.ts               # CRIAR
      [name].controller.ts           # CRIAR
      [name].service.ts              # CRIAR
      dto/
        create-[name].dto.ts         # CRIAR
        update-[name].dto.ts         # CRIAR
      entities/
        [name].entity.ts             # CRIAR
  tests/
    unit/
      [name].service.spec.ts         # CRIAR
    integration/
      [name].e2e.spec.ts             # CRIAR
```

### Arquivos a Modificar:
```
modules/[name]/
  service/
    src/
      app.module.ts                  # MODIFICAR (linhas ~45-50)
  README.md                          # MODIFICAR (adicionar seção)
```

---

## 8. Contratos de API

### Endpoint 1: POST /[resource]

**Request Body:**
```typescript
interface CreateDto {
  field1: string;
  field2?: number;
  field3: Date;
}
```

**Response (201):**
```typescript
interface ResponseDto {
  id: string;
  field1: string;
  field2?: number;
  createdAt: Date;
}
```

**Validações:**
- `field1`: required, string, min 3 chars
- `field2`: optional, number, > 0
- `field3`: required, ISO 8601 date

---

### Endpoint 2: GET /[resource]/:id

**Response (200):**
```typescript
interface ResponseDto {
  id: string;
  field1: string;
  field2?: number;
  createdAt: Date;
  updatedAt: Date;
}
```

**Errors:**
- `404`: Not Found
- `401`: Unauthorized

---

## 9. Pontos de Atenção Críticos

### ⚠️ ATENÇÃO 1: [Nome do ponto]
**Descrição:** [O que requer atenção especial]
**Por quê:** [Motivo da atenção]
**Como validar:** [Como garantir que está correto]

---

### ⚠️ ATENÇÃO 2: [Nome do ponto]
**Descrição:** [O que requer atenção especial]
**Por quê:** [Motivo da atenção]
**Como validar:** [Como garantir que está correto]

---

### 🔒 Segurança:
- [ ] Validar todos os inputs com DTOs
- [ ] Rate limiting em todas as rotas públicas
- [ ] Secrets via environment variables (nunca hardcoded)
- [ ] CORS configurado corretamente
- [ ] Logs não expõem dados sensíveis

---

## 10. Critérios de Aceitação

### Funcional:
- [ ] [Critério 1: Comportamento esperado]
- [ ] [Critério 2: Edge cases cobertos]
- [ ] [Critério 3: Integração funcionando]

### Qualidade:
- [ ] Testes > 80% coverage
- [ ] Lint sem erros (ESLint)
- [ ] Build sem warnings
- [ ] Type safety (TypeScript)

### Performance:
- [ ] Response time < [X]ms (p95)
- [ ] Throughput > [Y] req/s
- [ ] Sem memory leaks

### Documentação:
- [ ] README atualizado
- [ ] API documentada (Swagger)
- [ ] CHANGELOG atualizado
- [ ] Exemplos de uso incluídos

---

## 11. Riscos e Mitigações

### Risco 1: [Nome do risco]
**Probabilidade:** Alta/Média/Baixa
**Impacto:** Alto/Médio/Baixo
**Mitigação:** [Como evitar ou reduzir]
**Plano B:** [O que fazer se ocorrer]

---

### Risco 2: [Nome do risco]
**Probabilidade:** Alta/Média/Baixa
**Impacto:** Alto/Médio/Baixo
**Mitigação:** [Como evitar ou reduzir]
**Plano B:** [O que fazer se ocorrer]

---

## 12. Recursos e Referências

### Documentação Oficial:
- [Link para docs da biblioteca X]
- [Link para API do serviço Y]
- [Link para guia de best practices]

### Exemplos de Código:
- [Link para implementação similar no projeto]
- [Link para exemplo no GitHub]

### Contatos:
- **Arquitetura:** @architect (para dúvidas de design)
- **Infraestrutura:** @devops (para questões de deploy)
- **Produto:** @product (para clarificações de requisitos)

---

## 13. Próximos Passos do Receptor

**O que fazer imediatamente:**
1. Ler toda a documentação deste handoff
2. Revisar ANALISE.md e PLANO.md
3. Esclarecer dúvidas se houver (antes de começar)
4. Seguir checklist de implementação

**Durante a implementação:**
1. Fazer commits atômicos e descritivos
2. Testar incrementalmente
3. Reportar progresso regularmente
4. Pedir ajuda se bloqueado

**Ao concluir:**
1. Validar todos os critérios de aceitação
2. Executar checklist de compliance
3. Solicitar code review
4. Fazer handoff de volta (se aplicável)

---

## 14. Perguntas e Respostas

### P1: [Pergunta antecipada]
**R:** [Resposta clara]

---

### P2: [Pergunta antecipada]
**R:** [Resposta clara]

---

### Dúvidas adicionais:
Se houver dúvidas não cobertas neste handoff:
1. Verificar documentação do projeto em `00-Config/`
2. Consultar RULES-GLOBAL.md para validações
3. Perguntar no chat/Slack antes de assumir

**Regra de Ouro (R16):** "Se ambíguo, PARE e PERGUNTE"

---

## 15. Validação de Handoff

**Checklist de Handoff Completo:**
- [x] Contexto claramente descrito
- [x] Entregáveis listados e localizados
- [x] Decisões técnicas documentadas
- [x] Stack definida
- [x] Dependências mapeadas
- [x] Checklist de implementação completo
- [x] Arquivos a criar/modificar listados
- [x] Contratos de API especificados
- [x] Pontos de atenção destacados
- [x] Critérios de aceitação claros
- [x] Riscos identificados com mitigações
- [x] Recursos e referências fornecidos

---

## 16. Aprovação e Início

**Handoff aprovado por:**
- [x] @architect (origem)
- [ ] @codex-dev (destino - confirmar recebimento)

**Confirmação de recebimento:**
```
@codex-dev: Handoff recebido e compreendido.
Dúvidas: [Nenhuma / Listar dúvidas]
Início estimado: [Data/hora]
```

---

> [!success] Handoff Pronto
> Este handoff contém todas as informações necessárias para a implementação. Receptor deve confirmar recebimento antes de iniciar.

**Handoff ID:** [ID]
**Data:** [YYYY-MM-DD HH:MM]
**De:** [Agent origem]
**Para:** [Agent destino]
**Status:** ✅ Pronto para início

---

## Apêndice: Comandos Úteis

### Setup local:
```bash
# Instalar dependências
npm install

# Rodar em dev
npm run dev

# Rodar testes
npm test

# Rodar testes específicos
npm test -- [name].spec.ts

# Lint
npm run lint

# Build
npm run build
```

### Git workflow:
```bash
# Criar branch
git checkout -b feat/[task-id]-[description]

# Commits
git commit -m "feat([module]): add [feature]"

# Push
git push origin feat/[task-id]-[description]
```

### Docker:
```bash
# Subir services
docker-compose up -d

# Ver logs
docker-compose logs -f [service]

# Derrubar
docker-compose down
```
