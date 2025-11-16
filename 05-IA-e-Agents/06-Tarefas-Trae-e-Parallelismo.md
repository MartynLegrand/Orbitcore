# Tarefas Trae e Paralelismo ⚙️

## O que é `.task`
- Unidade atômica com objetivo, entradas, saídas e restrições.
- Ideal para dividir trabalho entre agents e rodar em paralelo.

## Como Criar Tasks
- Defina título curto (3–5 palavras).
- Especifique objetivo em até 30 palavras.
- Declare o agente ideal (Architect, Dev, Executor, Search).

## Exemplos
- "Extrair termos dos chats e gerar glossário prioritário."
- "Escrever templates de módulos em `03-Modulos-OBM/`."
- "Auditar links quebrados e limpar índices."

## Regras Anti-Erros por Prompt
- Sempre configurar ignore/index.
- Permitir `.docx` e converter para `.md`.
- Solicitar verificação e relatório de lacunas.
- Otimizar cache após alterações.

## Paralelismo Seguro
- Rodar tasks independentes simultaneamente.
- Reportar progresso por task.
- Reunir resultados e validar antes de escrever.