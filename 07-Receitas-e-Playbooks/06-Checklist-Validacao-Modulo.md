SOLO Coder

Thought process

Prompt Único

- Título: {SOLICITANDO UM NOVO MODULO PARA O ECOSSISTEMA}
- Objetivo: Criar {{MODULE_NAME}} no domínio {{MODULE_DOMAIN}} com API perfeita, gestão completa via {{POLL_MANAGER}} , compatível com qualquer core via {{CORE_ADAPTER}} e integrável com todos os módulos (capaz de atuar como node de [[03-Modulos-OBM/obm-orchestrator]] ).
- Placeholders: {{MODULE_NAME}} , {{MODULE_DOMAIN}} , {{API_VERSION}} , {{BASE_URL}} , {{CORE_ADAPTER}} , {{POLL_MANAGER}} , {{SDK_PACKAGE_NAME}} , {{DB_SCHEMA_NAME}} , {{NAMESPACE}} , {{EVENT_BUS}} , {{TOPIC_PREFIX}} , {{QUEUE_NAME}} , {{WEBHOOK_SECRET}} , {{AUTH_STRATEGY}} , {{RATE_LIMIT_POLICY}} , {{TRACE_HEADER}} , {{ENV}} .
- Leituras obrigatórias antes de iniciar: [[00-Config/00-Placeholders]] , [[01-Visao-Geral/03-Modulos-OBM-Visao-Geral]] , [[03-Modulos-OBM/00-Index-Modulos-OBM]] , [[03-Modulos-OBM/99-Conexoes-Entre-Modulos]] , [[04-Stacks-e-Infra/06-Docker-e-Deploy]] , [[06-Glossario-Tecnico/REST]] , [[06-Glossario-Tecnico/JWT]] , [[06-Glossario-Tecnico/Message-Queue]] , [[06-Glossario-Tecnico/Event-Driven]] , [[06-Glossario-Tecnico/Webhooks]] .
Tasks de Ponta a Ponta

- Arquitetura e Escopo

  - Prompt: Defina o escopo de {{MODULE_NAME}} em {{MODULE_DOMAIN}} , responsabilidades, limites, dependências e diagramas. Produza ARCHITECTURE.md com visão, componentes, contratos e critérios de aceitação. Linke para [[03-Modulos-OBM/00-Index-Modulos-OBM]] .
  - Saídas: ARCHITECTURE.md , mermaid de componentes, lista de dependências moduladas.
  - Validação: Responsabilidades não ambíguas, limites claros, dependências e critérios mensuráveis.
- Contrato de API

  - Prompt: Especifique API {{API_VERSION}} em {{BASE_URL}} com endpoints, métodos, paths, params, bodies, códigos, erros e exemplos. Gere API_CONTRACT.md com tabelas e JSON Schemas. Linke [[06-Glossario-Tecnico/REST]] .
  - Saídas: API_CONTRACT.md , schemas/json/ , exemplos curl e {{SDK_PACKAGE_NAME}} .
  - Validação: Endpoints completos, erros padronizados, versionamento aplicado, exemplos executáveis.
- Modelo de Dados e Migrações

  - Prompt: Defina entidades em {{DB_SCHEMA_NAME}} , chaves, índices e relacionamentos; crie migrações e seeds. Documente DATA_MODEL.md com diagramas e políticas de integridade.
  - Saídas: DATA_MODEL.md , diretório migrations/ , seeds/ .
  - Validação: Integridade referencial, índices adequados, migrações reversíveis e idempotentes.
- SDK Cliente

  - Prompt: Especifique {{SDK_PACKAGE_NAME}} com classes, métodos, tipos, erros e autenticação via [[06-Glossario-Tecnico/JWT]] . Documente SDK.md com semver e exemplos.
  - Saídas: SDK.md , src/sdk/ com tipos, exemplos de uso.
  - Validação: Cobertura total da API, tipos estritos, exemplos compiláveis e testáveis.
- Orquestração e POLLM

  - Prompt: Modele gestão via {{POLL_MANAGER}} com estados, transições, jobs, intervalos, timeouts, retries, backoff e cancelamento; defina endpoints e eventos no {{EVENT_BUS}} . Documente ORCHESTRATION.md . Integre como node em [[03-Modulos-OBM/obm-orchestrator]] .
  - Saídas: ORCHESTRATION.md , tabela FSM, endpoints de controle, tópicos {{TOPIC_PREFIX}}.* .
  - Validação: FSM finita, transições válidas, idempotência, tolerância a falhas e observabilidade dos ciclos.
- Integração Universal

  - Prompt: Mapeie integrações de {{MODULE_NAME}} com todos os módulos chave: obm-auth , obm-accounts , obm-permissions , obm-notifications / obm-notify , obm-payments , obm-billing , obm-wallet , obm-subscriptions , obm-analytics / obm-telemetry , obm-search , obm-cms , obm-media , obm-files , obm-storage , obm-nft-marketplace , obm-streaming , obm-music-demos . Especifique HTTP, eventos, webhooks e SDKs. Atualize INTEGRATIONS.md e [[03-Modulos-OBM/99-Conexoes-Entre-Modulos]] .
  - Saídas: INTEGRATIONS.md , matriz de rotas/tópicos/webhooks, adapters {{CORE_ADAPTER}} .
  - Validação: Contratos consistentes, políticas de retries/backoff, verificação HMAC e compatibilidade cruzada.
- Segurança e Compatibilidade com Qualquer Core

  - Prompt: Padronize autenticação/autorizações (RBAC), {{RATE_LIMIT_POLICY}} , auditoria, secrets, propagação de {{TRACE_HEADER}} . Especifique adapters {{CORE_ADAPTER}} para qualquer core, feature flags e configuração por {{ENV}} . Documente SECURITY_COMPAT.md .
  - Saídas: SECURITY_COMPAT.md , matriz RBAC, políticas de rate-limit, adapters e flags.
  - Validação: RBAC completo, contexto seguro, compatibilidade configurável sem acoplamento rígido.
- Testes e Validação

  - Prompt: Defina testes unitários, integração e e2e cobrindo API, SDK, POLLM, eventos e webhooks; gere fixtures e dados. Documente TESTING.md com cobertura mínima e cenários críticos.
  - Saídas: TESTING.md , tests/unit|integration|e2e , relatórios de cobertura.
  - Validação: Cobertura mínima atingida, testes de falha/recuperação, cenários críticos contemplados.
- Observabilidade

  - Prompt: Especifique logs, métricas e tracing com nomes, níveis, labels e exportações; inclua correlação. Documente OBSERVABILITY.md e referencie [[04-Stacks-e-Infra/12-Observabilidade-e-Monitoracao]] .
  - Saídas: OBSERVABILITY.md , mapa de métricas e spans, convenções de logs.
  - Validação: Campos essenciais, métricas úteis, tracing de ponta a ponta.
- Deploy e Monitoramento

  - Prompt: Especifique Docker/K8s/CI-CD, variáveis, health/readiness/liveness probes, rollback, escalabilidade e monitoramento ativo. Documente DEPLOY.md . Linke [[04-Stacks-e-Infra/06-Docker-e-Deploy]] .
  - Saídas: DEPLOY.md , Dockerfile , manifestos K8s, pipeline CI-CD.
  - Validação: Build reproduzível, checks ok, rollout/rollback verificados, auto‑scaling e alertas.
- Documentação e Navegação

  - Prompt: Compile documentação .md separada por tema com títulos, seções, wikilinks, imagens e diagramas, mantendo auto‑referência. Atualize índice [[03-Modulos-OBM/00-Index-Modulos-OBM]] .
  - Saídas: ARCHITECTURE.md , API_CONTRACT.md , DATA_MODEL.md , SDK.md , ORCHESTRATION.md , INTEGRATIONS.md , SECURITY_COMPAT.md , TESTING.md , OBSERVABILITY.md , DEPLOY.md .
  - Validação: Navegação coesa, sem links quebrados, estrutura completa e consistente.
Interfaces de Comunicação

- REST

  - Prompt: Liste endpoints GET/POST/PUT/DELETE de {{MODULE_NAME}} com schemas, códigos e exemplos em {{API_VERSION}} .
  - Saídas: Tabela de endpoints, JSON Schemas, exemplos curl e SDK.
- Eventos

  - Prompt: Defina tópicos {{TOPIC_PREFIX}}.* no {{EVENT_BUS}} , chaves, payloads, garantias e políticas de retries/backoff/DLQ.
  - Saídas: Catálogo de eventos versionado, schemas, políticas.
- Webhooks

  - Prompt: Especifique assinaturas HMAC {{WEBHOOK_SECRET}} , headers, retries com backoff e callbacks idempotentes.
  - Saídas: Matriz de webhooks, exemplos e verificações.
- SDK (TypeScript)

  - Prompt: Gere interface pública com métodos, tipos, erros e autenticação; inclua exemplos de uso e guidelines de semver.
  - Saídas: Especificação do cliente e docstrings.
Checklist de Implementação

- Arquitetura e escopo definidos com critérios
- API REST {{API_VERSION}} completa e versionada
- Modelo de dados, migrações e seeds
- SDK autenticado e tipado
- POLLM com FSM, endpoints e eventos
- Integrações universais com módulos OBM
- Segurança, compatibilidade cross‑core e adapters
- Testes unit/integration/e2e com cobertura mínima
- Observabilidade log/métricas/tracing
- Deploy Docker/K8s/CI-CD, rollback e monitoramento
- Documentação .md com wikilinks atualizados
Prompt Base Reutilizável

- Prompt: Crie {{MODULE_NAME}} no domínio {{MODULE_DOMAIN}} com API perfeita ( {{API_VERSION}} ), SDK {{SDK_PACKAGE_NAME}} , orquestração via {{POLL_MANAGER}} , integração total com módulos OBM e compatibilidade com qualquer core via {{CORE_ADAPTER}} . Entregue ARCHITECTURE.md , API_CONTRACT.md , DATA_MODEL.md , SDK.md , ORCHESTRATION.md , INTEGRATIONS.md , SECURITY_COMPAT.md , TESTING.md , OBSERVABILITY.md , DEPLOY.md . Utilize wikilinks e placeholders conforme [[00-Config/00-Placeholders]] . Valide cada etapa com critérios objetivos e testes.
Documentação MD

- Formato: arquivos .md separados por tema, auto‑referenciais com wikilinks.
- Título: {SOLICITANDO UM NOVO MODULO PARA O ECOSSISTEMA}.
- Referências meta: sempre linkar seções correlatas em [[03-Modulos-OBM/00-Index-Modulos-OBM]] , [[03-Modulos-OBM/99-Conexoes-Entre-Modulos]] , [[04-Stacks-e-Infra/06-Docker-e-Deploy]] .
O Que Mais Incluir no Prompt

- SLO/SLI e orçamentos de performance para API e jobs POLLM
- Taxonomia de erros, códigos padronizados e política de reintentos
- Políticas de versionamento e depreciação de contratos
- Idempotência e consistência: estratégias e garantias explícitas
- Registro central de schemas e validade backward/forward
- Segurança e compliance (LGPD), retenção e anonimização de dados
- Modelo de ameaças e mitigação de riscos
- Rate limiting, feature flags e toggles de comportamento
- Playbook de migração e estratégia de fallback
- Artefatos de sandbox: stubs/mocks para integrações
- Parâmetros de testes de carga e compatibilidade cruzada
- Readiness gates, plano de rollout e rollback documentados
- Convenções de nomes para logs/métricas/tracing e correlação
- Matriz de compatibilidade entre {{MODULE_NAME}} e cada módulo OBM
Esses prompts e tarefas são exatos, não ambíguos e cobrem integralmente a criação, integração, operação e documentação do módulo conforme a árvore e as especificações, incluindo gestão POLLM, compatibilidade universal com o core e atuação como node do orquestrador, com validação objetiva em cada etapa.
