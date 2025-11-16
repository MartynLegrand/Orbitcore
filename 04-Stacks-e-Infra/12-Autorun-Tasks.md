# Autorun de Tasks (Orquestração)

## Objetivo
- Identificar e iniciar automaticamente a próxima tarefa prioritária.
- Registrar transições, alocar recursos, tratar erros.

## Arquivos
- `infra/tasks.queue.json` (fila e critérios: urgency, importance, deadline)
- `scripts/autorun.ps1` (Windows)
- `scripts/autorun.sh` (Linux/macOS)
- `infra/tasks.state.json` (estado atual; gerado automaticamente)
- `logs/transitions.json` (histórico de transições)
- `logs/autorun.log` (log detalhado)
- `logs/notifications.md` (notificações de fluxo)

## Execução
- Windows: `powershell -File scripts/autorun.ps1`
- Linux/macOS: `./scripts/autorun.sh`

## Funcionamento
- Prioriza por pontuação (urgency, importance, proximidade do deadline).
- Verifica dependências antes de iniciar.
- Monitora CPU (threshold) para alocação de recursos.
- Registra transições (completed/failed) e logs.
- Notifica falhas em `logs/notifications.md`.

## Tratamento de Erros
- Dependências não concluídas: marca como `failed` e prossegue.
- Comando com exit code != 0: registra erro e falha a tarefa.

## Extensão
- Adapte `commands` no `tasks.queue.json` para rodar tarefas reais (builds, scripts, geração de docs).
- Integre com CI/CD para execução em pipeline.