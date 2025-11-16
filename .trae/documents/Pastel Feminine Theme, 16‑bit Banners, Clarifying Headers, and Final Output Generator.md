## Objetivos

* Atualizar o visual para um tema pastel, sutil e feminino (mantendo legibilidade), substituindo o tom atual.

* Colocar banners 16‑bit no topo de cada nota relevante, alinhados à paleta do tema.

* Aplicar ícones nas pastas (Iconize) e tornar títulos autoexplicativos com cabeçalhos claros.

* Explicar e materializar como o preenchimento gera uma nota final pronta (documento comercial) por meio de um novo gerador.

## Tema Pastel

* Criar snippet `pastel-dracula.css` com paleta suave (pastéis) mantendo contraste mínimo AA:

  * Neutros clarinhos; accents lilás/rosa/azul suaves.

  * Ajustes em headings, links, tags, tabelas e callouts.

* Ativar `pastel-dracula.css` junto com `trae.css` e `icons-dracula.css`.

## Banners 16‑bit no topo

* Pasta `Assets/banners/16bit/` com pequenas artes 16‑bit (mono/paleta pastel) para Empresa/Serviços/Portfólio/Contato, Comercial/Proposta/Orçamento/Contrato, Briefings, Painéis.

* CSS `.note-banner` no topo com imagem 16‑bit e overlay suave.

* Atualizar notas e templates para usar `note-banner` logo após o frontmatter.

## Ícones nas Pastas

* Expandir `iconize/data.json` com ícones mais bonitos e coerentes para todas as pastas (Empresa, Negócios, Comercial, Pricing, Templates, Painéis‑Geradores, Glossário, Aprendizado, Vida, Assets), mantendo estilo mono.

## Cabeçalhos e Títulos Autoexplicativos

* Inserir bloco de cabeçalho em todas as notas/templates:

  * Linha de propósito (o que é), contexto (para que serve), e "Como usar" curto.

  * Mostrar ícone e banner no topo, seguido do cabeçalho explicativo.

## Geração de Nota Final

* Novo gerador: `Painéis‑Geradores/GERADOR - Proposta Final.tmpl.md` que:

  * Lê dados do briefing ou dos templates preenchidos (Orçamento/Proposta/Contrato) e compila em um único documento final (nota pronta) com layout diagramado, cabeçalho, banner, resumo de valores, termos e bloco de assinatura.

  * Cria sempre um novo arquivo com nome `Comercial/Propostas Finais/Proposta Final - <Cliente> - <Projeto> - <YYYY-MM-DD>-<HHmm>.md`.

* QuickAdd: adicionar escolha "GERADOR: Proposta Final" apontando para o novo template.

## Como vai funcionar (Fluxo)

1. Preencher o briefing e/ou os templates (Orçamento/Proposta/Contrato).
2. Executar "GERADOR: Proposta Final" no QuickAdd.
3. O gerador compila tudo em uma única nota final pronta, com banner 16‑bit, ícones, tabelas e checklists.
4. Exportar (PDF/Publish) se desejado.

## Entregáveis

* `pastel-dracula.css` e atualização de snippets ativos.

* Banners 16‑bit em `Assets/banners/16bit/` e uso via `.note-banner`.

* Ampliação de `iconize/data.json` para ícones de pastas.

* Cabeçalhos autoexplicativos adicionados em templates e MOCs.

* `GERADOR - Proposta Final.tmpl.md` e entrada no QuickAdd.

## Segurança

* Apenas CSS, Markdown e arquivos locais; sem dependências externas.

## Próximo

* Com aprovação, implemento o tema pastel, banners 16‑bit, cabeçalhos, ampliação de ícones e o novo gerador de "Proposta Final" com QuickAdd.

