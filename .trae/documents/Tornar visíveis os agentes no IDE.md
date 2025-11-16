## Diagnóstico
- A lista da barra mostra apenas agentes embutidos (SOLO Coder/Builder). 
- `mcp.json` e `.vscode/mcp.json` adicionam servidores MCP (ferramentas), não criam agentes automaticamente.
- Para aparecerem na barra, os agentes precisam ser registrados manualmente na UI do IDE.

## O que já está pronto
- `c:\Users\lucas\Documents\GitHub\DEVVAULT\mcp.json` e `c:\Users\lucas\Documents\GitHub\DEVVAULT\.vscode\mcp.json` configuram `github-mcp` sem segredos.
- Notas de requisitos em `.trae/documents` descrevem "GitHub Ops Manager" e trio "Orbit".

## Passos no IDE (sem editar arquivos)
1. Abrir o painel de chat e clicar em `Create Agent`.
2. Criar agentes:
   - GitHub Ops Manager: usar escopo/regras conforme notas; permitir ferramentas do `github-mcp`.
   - Orbit Architect / Codex Dev / Executor: registrar com nomes e descrições; sem ferramentas extras por enquanto.
3. Abrir o seletor de ferramentas (Tool Picker) e permitir as ferramentas do servidor `github-mcp` para o(s) agente(s) desejado(s).
4. Se o IDE pedir, autenticar o GitHub (sem tokens no repo). 
5. Recarregar o IDE se a lista não atualizar imediatamente.

## Validação
- Ver na barra os agentes recém-criados.
- Testar um comando simples no agente com `github-mcp` (ex.: listar issues) e confirmar a solicitação de permissão de ferramenta.

## Próximo (opcional)
- Adicionar servidores MCP leves (File System, Fetch, context7, Docker, Time) para ampliar ferramentas dos agentes.
- Mapear instruções curtas para cada agente, prontas para colar na UI.

Confirma que prossigo guiando a criação dos agentes na UI e, em seguida, habilito MCPs leves adicionais?