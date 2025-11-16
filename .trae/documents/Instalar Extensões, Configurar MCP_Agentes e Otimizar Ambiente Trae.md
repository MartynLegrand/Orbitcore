## Extensões Recomendadas
- Instalar via CLI quando disponível:
  - `code --install-extension esbenp.prettier-vscode`
  - `code --install-extension dbaeumer.vscode-eslint`
  - `code --install-extension editorconfig.editorconfig`
  - `code --install-extension eamodio.gitlens`
- Alternativa Trae CLI (se existir):
  - `trae --install-extension esbenp.prettier-vscode`
  - `trae --install-extension dbaeumer.vscode-eslint`
  - `trae --install-extension editorconfig.editorconfig`
  - `trae --install-extension eamodio.gitlens`
- Fallback manual: abrir Marketplace e instalar as quatro extensões.
- Verificação: `code --list-extensions | findstr prettier\|eslint\|editorconfig\|gitlens`.

## Configurações Globais de Produtividade
- Formatação e lint:
  - `editor.defaultFormatter: "esbenp.prettier-vscode"`
  - `editor.formatOnSave: true`
  - `editor.codeActionsOnSave: { "source.organizeImports": true, "source.fixAll": true }`
  - `eslint.validate: [javascript, typescript, javascriptreact, typescriptreact]`
- Fluxo e desempenho:
  - `files.autoSave: "afterDelay"`, `files.autoSaveDelay: 800`
  - `workbench.editor.enablePreview: false`
  - `workbench.startupEditor: "none"`
  - `search.useIgnoreFiles: true`
  - `terminal.integrated.tabs.enabled: true`, `terminal.integrated.shellIntegration.enabled: true`
  - `telemetry.telemetryLevel: "off"`
- Watcher Exclude (quando houver projeto grande):
  - `files.watcherExclude: { "**/node_modules/**": true, "**/.git/**": true, "**/dist/**": true }`
- Atalhos produtivos:
  - `Alt+Enter` → Quick Fix
  - `Ctrl+Alt+O` → Organize Imports
  - `Ctrl+Alt+F` → Format Document
  - `Ctrl+Alt+T` → Toggle Terminal
  - `Ctrl+Shift+R` → Rename
  - `Ctrl+Shift+G` → SCM
  - `Ctrl+Alt+B` → Toggle Sidebar

## MCP/Agentes: Enxugar, Ativar por Nicho e Segurança
- Ativos por padrão (leves e úteis): `Fetch`, `Docker`, `context7`, `Time`, `File System`.
- Desativar inicialização automática de servidores pesados (GitHub, Stripe, Blender, Puppeteer, GDrive, Qdrant) e ativar sob demanda.
- Segurança de segredos: usar variáveis de ambiente locais (não commitar), ex.: `GITHUB_PERSONAL_ACCESS_TOKEN`, `STRIPE_SECRET_KEY` via Windows Environment/Secret Manager.
- Nichos sugeridos e quando ativar:
  - Web scraping/automação: `Puppeteer` (ativar apenas ao usar browser automation).
  - Integração Git/GitHub/GitLab: `Git`, `GitHub`, `GitLab` (ativar quando houver tokens e repositórios).
  - Payments/Stripe: `Stripe` (ativar para testes com chaves de teste, nunca em produção sem proteção).
  - Dados e vetores: `Qdrant Server` (ativar para POC de busca semântica).
  - Documentação/contexto: `context7` (já ativo) e `Fetch`.
  - Arquivos locais: `File System` (já ativo).
- Ajuste do `mcp.json`: manter apenas os ativos listados; registrar os demais com `fromGalleryId` mas sem env sensíveis.

## SDKs e Toolchains
- Node.js: manter LTS para máxima compatibilidade (recomendado 20.x ou 22.x). A imagem mostra `Node.js 25.1.0`; ajustar para LTS.
  - Habilitar Corepack: `corepack enable`.
  - Definir manager padrão: `pnpm` (`corepack prepare pnpm@latest --activate`).
- Python (opcional): instalar `uv` para ambientes rápidos e isolamento: `pip install uv` ou instalador oficial.
- Docker: garantir Docker Desktop ativo para agentes Docker.
- Git: configurar global `core.autocrlf true` e `pull.rebase false` no Windows.

## Development Environment (área da imagem)
- Node Version: selecionar `Node.js 22.x LTS` ou `20.x LTS` em vez de `25.1.0` (evita incompatibilidades em libs/CLIs).
- Package Manager: definir `pnpm` como padrão.
- Terminal: perfil `PowerShell` com shell integration habilitada.
- Opções de inicialização: reduzir abertura de workspaces pesados; desativar servidores MCP pesados no startup.

## Verificação Pós-Configuração
- Extensões instaladas: listar e confirmar.
- Settings aplicadas: abrir `settings.json` do usuário e checar chaves acima.
- MCPs: iniciar um servidor leve e verificar logs de conexão; checar que pesados não iniciam automaticamente.
- Node: `node -v` e `corepack --version` para confirmar.

## Opcional (quando houver projeto)
- Adicionar `.editorconfig`, `eslint.config.js`/`.eslintrc`, `.prettierrc` alinhados ao stack do projeto.
- Habilitar `pre-commit` com lint/format.

## Execução
- Detectar CLI (`where code`, `where trae`).
- Se disponível, executar comandos de instalação de extensões.
- Aplicar ajustes em `settings.json` e `keybindings.json` do usuário.
- Editar `mcp.json` para manter apenas MCPs leves.
- Ajustar Node LTS no painel Development Environment.
- Validar com comandos de verificação e logs.

Confirma que sigo com esta execução agora? 