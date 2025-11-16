## Objetivo
- Registrar e disponibilizar os agentes mencionados (GitHub Ops Manager e trio Orbit: Architect, Codex Dev, Executor) e ativar MCPs leves.

## Entregáveis
- Arquivo `mcp.json` no workspace com registro dos MCPs e agentes.
- Agentes operacionais sem chaves sensíveis, seguindo políticas de segurança.
- Verificação de carregamento e saúde dos agentes/MCPs.

## Passos
1. Criar `mcp.json` na raiz do projeto com MCPs leves: `Fetch`, `context7`, `Docker`, `Time`, `File System`.
2. Registrar agente "GitHub Ops Manager" (sem versionamento automático, sem token) conforme diretrizes.
3. Registrar trio de agentes Orbit (Architect, Codex Dev, Executor) com instruções padrão e escopos restritos.
4. Aplicar políticas de segurança: Workspace Trust ativo; desabilitar inicialização automática de MCPs pesados; nenhuma chave/secret em arquivo.
5. Validar: iniciar MCPs leves, verificar logs de conexão e que agentes carregam corretamente; confirmar que MCPs pesados não iniciam.
6. Documentar pontos de acesso no IDE (sem adicionar arquivos extras): como acionar os agentes e verificar status.

## Validação
- Executar checagens de estado pós-configuração e apresentar a lista de agentes ativos e MCPs carregados.

## Observações
- Nenhum secret será incluído; tokens permanecerão vazios.
- Mudanças limitadas a `mcp.json`; sem criar documentação adicional.