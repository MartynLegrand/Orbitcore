## Objetivos
- Configurar o ambiente para executar tasks continuamente (sem parar), com fila grande e priorização.
- Integrar o autorun com Trae (Tasks) para ingestão/execução automática.

## Ajustes de Configuração
- Concurrency: definir `maxConcurrent` (ex.: 3) para rodar múltiplas tasks em paralelo com segurança.
- Prioridade: critérios (urgência, importância, deadline, aging) aplicados no scheduler.
- Thresholds: CPU≥85% e RAM≥80% pausam novas tasks; retomada automática.
- Notificações: habilitar logs e notificação em `logs/notifications.md`; opcional webhook.

## Integração com Trae (Tasks)
- Ingestão: converter listas de tarefas (Roadmap) em entradas da fila (`tasks.queue.json`).
- Sincronização: ao concluir uma task, disparar import da próxima via autorun.
- Mapeamento: cada task Trae → comando(s) autorun (`commands`), dependências e critérios.

## Estrutura de Fila (Grande)
- Shards: `tasks.queue.part-*.json` para backlog grande, carregados incrementalmente.
- Estados: `pending`, `ready`, `in_progress`, `blocked`, `failed`, `completed`.
- DLQ: `tasks.dlq.json` para falhas após retries.

## Observabilidade
- Métricas (Prometheus): tasks_ready, tasks_in_progress, tasks_failed, task_duration_seconds.
- Dashboards (Grafana): estado de filas, taxa de conclusão, tempo médio, falhas.
- Logs: `logs/autorun.log` e `logs/transitions.json` com correlação por taskId.

## Tratamento de Erros
- Pre-flight: checagem de dependências e ambiente.
- Retries com backoff exponencial (máx 3); `failed` → DLQ.
- Notificar falhas e sugerir ações.

## Segurança
- Sandbox: allowlist de shells/comandos; timeouts e kill em stuck.
- Sem secrets em logs; secrets via `.env`/secret manager.

## Plano de Execução
- Fase 1: Configurar parâmetros (concurrency/thresholds/prioridade) e habilitar ingestão de Roadmap (Trae → fila).
- Fase 2: Ativar autorun contínuo e validar transições/notifications.
- Fase 3: Habilitar observabilidade (métricas/dashboards) e testes de carga com fila grande.
- Fase 4: Adicionar DLQ, retries e rotas de recuperação.
- Fase 5: Documentar operações (operacional/segurança) e treinar uso de Tasks em lote.

## Critérios de Conclusão
- Autorun executa sem parar, consome a fila grande com prioridades.
- Transições e logs detalhados, métricas expostas e dashboards operantes.
- Notificações ativas; DLQ funcionando; sem vazamento de secrets.
