## Objetivo
- Adicionar ícones bonitos e exclusivos (não-"emojis comuns") em todo o vault, mantendo estética monocromática (Dracula).
- Aplicar ícones em pastas, notas, seções e geradores; incluir emojis/ícones custom para callouts e headings.

## Abordagem
- Packs de ícones (SVG mono): criar `Assets/icons/` com um conjunto curado (Tabler/Phosphor/Lucide selecionados), todos em SVG.
- Snippet CSS dedicado (`icons-dracula.css`):
  - Mapeia classes para cada ícone via `mask`/`-webkit-mask` e `background-color: currentColor` (fica mono e herda cor).
  - Classes: `.icon-escopo`, `.icon-requisitos`, `.icon-pipeline`, `.icon-entregaveis`, `.icon-cronograma`, `.icon-orcamento`, `.icon-contrato`, `.icon-proposta`, `.icon-cliente`, `.icon-servico`, etc.
- Injeção leve nas notas:
  - Prefixar headings com `<span class="icon icon-escopo"></span>` (Obsidian permite HTML inline).
  - Ou usar callouts (Admonition) com `title_icon` custom (se instalar o plugin).
- Pastas/Notas:
  - Expandir `iconize/data.json` para apontar ícones diferentes por pasta/tipo (ex.: `pricing` → `dollar`, `briefing` → `file-cog`, `dashboard` → `layout-dashboard`).
- Emojis custom (não comuns):
  - Adicionar OpenMoji/Noto Emoji (mono) em `Assets/emojis/` como SVG/PNG.
  - Snippet CSS: `.emoji-special` com `content: url(...)` em pseudo-elemento para uso em blocos "note-usage" e checklists.

## Onde aplicar
- Geradores (Proposta Integrada, Proposta do Briefing): ícones de seção e marcações visuais já existentes; substituir bullets por ícones SVG.
- Templates Comerciais (Orçamento/Proposta/Contrato): ícones nas seções (Itens, Resumo, Observações, Modo de Uso), checklists com ícones.
- Briefings: ícones nas seções "Modo de Uso", "Critérios de Aceitação", "Serviços Correlatos".
- MOCs/Índices: ícone no header e banners já ligados ao `Assets/`.

## Passos
1) Criar `Assets/icons/` e `Assets/emojis/` com SVGs curados (mono).
2) Adicionar `icons-dracula.css` para mapear classes de ícones e emojis.
3) Atualizar `iconize/data.json` com ícones novos por pasta/tipo.
4) Inserir spans de ícone nas principais seções de templates e geradores.

## Resultado
- Ícones bonitos e consistentes em todo o vault, sem poluição visual, 100% mono e alinhados ao Dracula.
- Maior legibilidade e percepção de qualidade nas saídas (propostas/contratos/relatórios).

## Segurança
- Apenas arquivos SVG locais e CSS; nenhuma dependência externa.

## Próximo
- Ao aprovar, adiciono o pack `Assets/icons`/`emojis`, crio o snippet `icons-dracula.css`, mapeio classes e aplico nos templates/geradores selecionados.