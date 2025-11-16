## Objetivos
- Substituir os ícones atuais por um conjunto curado de libs padrão (Lucide + Tabler), em SVG mono, alinhados à paleta pastel feminina.
- Criar banners 16‑bit/retro com SVGs e padrões pixelados, mantendo cores do tema e adicionando animações suaves (CSS-only).
- Diagramar como uma UI: ícones consistentes, banners no topo, micro‑animações discretas, referências claras nos cabeçalhos.

## Bibliotecas
- Ícones: Lucide + Tabler Icons (ambos OSS, consistentes em stroke/estilo). Foco em mono e legibilidade.
- Banners: SVGs próprios com pixel grid/pattern e gradientes pastel; sem dependência externa. Animações via CSS (`keyframes`, `opacity`, `transform`).

## Paleta Pastel
- Base: lilás, rosa, cyan, mint e peach já definidas em `pastel-dracula.css`. Ajustes finos no contraste e saturação.
- Aplicação: headings, links, tags, tabelas, banners e ícones herdando `currentColor`.

## Implementação
- Criar `Assets/icons/tabler/` e `Assets/icons/lucide/` com SVGs curados (user, file-text, calculator, scroll, layout-dashboard, dollar-sign, building, briefcase, megaphone, clapperboard, rocket, code, server).
- Atualizar `.obsidian/plugins/iconize/data.json` para usar nomes de ícones das libs, mantendo mono.
- Criar `Assets/banners/16bit/` com 4–6 SVGs temáticos (Empresa, Negócios, Comercial, Proposta, Orçamento, Contrato) com pixel patterns e gradientes pastel.
- Snippet `pastel-dracula.css`:
  - `.note-banner` com animação leve (`float`/`shimmer`) e overlay pastel.
  - Ajustes nas tabelas e callouts para reforçar o ar feminino suave.
- Snippet `icons-dracula.css`:
  - Mapear novas classes `.icon-*` para os SVGs de Lucide/Tabler.
  - Adicionar micro‑animações (`hover: gentle-wiggle`) com `will-change`.

## Cabeçalhos autoexplicativos
- Em todas as notas/geradores/templates:
  - Topo: `.note-banner` → cabeçalho `.note-header` com "O que é / Para que serve / Como usar".
  - Ícones de seção nos headings (ex.: Escopo, Orçamento, Proposta, Contrato).

## Geração de saída
- Manter geradores existentes e reforçar o novo "Proposta Final".
- QuickAdd: garantir criação SEMPRE nova em `Comercial/Propostas Finais` com timestamp.
- Visual final: documento com banner 16‑bit animado, ícones mono nas seções, tabelas pastel, checklist final.

## Passos
1) Adicionar conjunto de SVGs das libs às pastas de `Assets/icons/...` e atualizar o snippet `icons-dracula.css`.
2) Criar banners 16‑bit (SVG) e aplicar `.note-banner` com animações leves.
3) Atualizar `iconize/data.json` para novas referências.
4) Revisar cabeçalhos e seções nos templates/geradores para títulos autoexplicativos.

## Resultado
- UI coesa, feminina e profissional; ícones bonitos e banners criativos no topo; legibilidade e estética melhoradas.

## Segurança
- Apenas arquivos locais (SVG/CSS) e edits no vault; sem dependência externa em runtime.

## Próximo
- Com aprovação, faço a substituição dos ícones, crio os banners, ativo animações e atualizo os cabeçalhos para todos os templates e geradores relevantes.