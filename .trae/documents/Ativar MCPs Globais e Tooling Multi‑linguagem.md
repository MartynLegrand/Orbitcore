## Complemento Solicitado: Agente GitHub Ops (não‑versionamento)
- Novo agente: "GitHub Ops Manager"
- Modelo: gpt-5 (reasoningEffort: medium)
- MCPs: GitHub (env: GITHUB_PERSONAL_ACCESS_TOKEN=""), Fetch, context7
- Escopo (não‑versionado): Issues, PR metadata (labels, reviewers), Projects/Boards, Milestones, Labels, Releases, Webhooks, Gists, Actions (workflows e secrets apenas por referência; nunca ler/baixar segredos)
- Regras:
  - Não modifica código nem empurra commits; foca em gestão/automação de superfícies não‑versionadas
  - Para ações destrutivas (deletar repo, release, label em massa), exige aprovação explícita
  - Gera templates de labels/milestones/projects e atualiza via API GitHub
  - Relatório final: “Tokens utilizados: <N>”

## Plano Global (resumo)
- Ativar MCPs globais úteis com env vazios: File System, Fetch, context7, Docker, Time, Git, GitHub, GitLab, Puppeteer, MySQL, Qdrant, Google Drive, Google Maps, YouTube, Excel, Apify Actors, Stripe
- Registrar trio de agentes Orbit (Architect, Codex Dev, Executor) com instruções e token reporting
- Instalar/ajustar tooling multi‑linguagem (Node/Python/Go/.NET/Java/Rust/Ruby/PHP) e extensões do editor
- Políticas de segurança: Workspace Trust ativo, sem auto‑runs destrutivos, MCPs pesados sob demanda
- Verificação: listar versões/paths, extensões instaladas, MCPs carregando sem chaves, agentes reportando tokens

Confirma que eu crie e registre o "GitHub Ops Manager" e prossiga com a ativação global dos MCPs conforme acima?