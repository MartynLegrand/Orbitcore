## Diretriz Principal

* Não alterar a raiz fora das pastas do projeto. Toda reorganização ocorrerá apenas em:

  * `c:\Users\lucas\Documents\GitHub\Bluesky-obsidian`

  * `c:\Users\lucas\Documents\GitHub\DEVVAULT` (apenas dentro dos subdiretórios existentes)

* Após consolidar o Bluesky, excluir artefatos redundantes e manter apenas a versão final.

## Bluesky‑obsidian

* Estrutura interna proposta:

  * `core/` (lógica de quests, dados e assets essenciais)

  * `themes/` (8bit‑rpg, dracula)

  * `plugins/` (`blue-sky-quest`, integrações Obsidian)

  * `docs/` (guia, changelog, instalação)

  * `templates/` (modelos de notas/quests/minigames)

  * `packages/BLUE-SKY-SUPERPACK/` (`v1.0.0`, `v2.0.0`, `v3.0.0`)

* Migração dos ZIPs:

  * Extrair os quatro ZIPs para temporários internos.

  * Deduplicar `main.js`, `styles.css`, `manifest.json`, `data/*.json`.

  * Normalizar LORE (`*.md|*.mdm`) em `docs/` e `templates/`.

  * Manter `v3.0.0` como base final; registrar diffs no `docs/CHANGELOG.md`.

* Build final:

  * Gerar pacote unificado `packages/BLUE-SKY-SUPERPACK/v3.0.0.zip` a partir de `core/`, `themes/`, `plugins/`, `templates/`.

* Limpeza:

  * Remover ZIPs antigos e temporários; manter apenas `v3.0.0.zip` e fontes organizadas.

## DEVVAULT (somente dentro da pasta)

* Hierarquia:

  * `01-system/` (configs: `.obsidian`, `.vscode`, `.trae`, `automation/`, `schemas/`, `docs/`)

  * `02-content/` (mover `Aprendizado`, `Empresa`, `Comercial`, `Negócios`, `Vida`, `Glossário`, `Pricing`, `Templates`, `Assets`)

  * `03-workflows/` (unificar `Painéis-Geradores` e `Dashboards`)

  * `04-apps/` (`tmp-siteapp-main`, `connectors/`)

* Metadados:

  * Frontmatter padrão: `id`, `title`, `category`, `tags`, `status`, `version`, `relations`, `priority`, `owner`.

* Ferramentas interativas:

  * Calculadoras e Orçamentos: DataviewJS + Buttons + Templater; pricing em JSON.

  * Listas de compras: `Pricing/catalog.json` + conector de preços.

  * Notificações: regras em `schemas/notifications.yaml` + gerador de alertas.

* Dashboard unificado em `03-workflows/Dashboards/index.md` com KPIs por domínio.

* Versionamento de documentos: `version` no frontmatter + pasta `versions/` por item crítico.

## Automação e Scripts (armazenados dentro de DEVVAULT)

* `automation/bluesky/*`: extrair/validar/gerar pacote final.

* `automation/devvault/*`: reestruturar, aplicar schemas, corrigir links/tags.

* `automation/pricing/update_prices.*`: atualizar preços e registrar deltas.

* `automation/reports/generate_reports.*`: KPIs em Markdown/CSV/HTML.

* `automation/sync/obsidian_git.*`: backups e sincronização local.

## Verificações e Compatibilidade

* Linters de frontmatter; verificação de links; testes das ferramentas interativas.

* Obsidian: plugins (Dataview, Templater, Buttons, MetaEdit, Obsidian Git, Advanced Tables) e ajustes de aparência.

* VSCode: tasks para rodar scripts; integração com LLM local via `.vscode/mcp.json`.

## Fases

* F1: Extrair ZIPs e mapear conteúdos.

* F2: Unificar Bluesky e gerar `v3.0.0.zip`.

* F3: Reestruturar DEVVAULT e aplicar metadados.

* F4: Implementar ferramentas, dashboards e LLM.

* F5: Automação de preços/relatórios/sync e testes.

* F6: Limpeza, documentação e backups.

## Perguntas Rápidas (para máxima precisão)

* Confirmar se `v3` é a versão final desejada para o BLUE‑SKY‑SUPERPACK.

* Fonte de preços: usar arquivos locais (`Pricing/*.json`) ou integrar com fornecedores específicos/APIs?

* Preferências de badges/XP para o “game”: nomes e níveis.

## Próximo Passo

* Com sua confirmação, executo a reorganização somente dentro das pastas indicadas, consolido o Bluesky e limpo artefatos antigos, mantendo apenas a versão final.

