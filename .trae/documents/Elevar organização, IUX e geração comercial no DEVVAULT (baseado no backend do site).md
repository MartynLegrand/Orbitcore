## Objetivos
- Tornar o vault absolutamente intuitivo, esteticamente lindo (Dracula mono), completo e especialista.
- Refatorar estrutura, enriquecer templates com cabeçalho e "Modo de Uso", adicionar ícones/embeds e criar geradores de saída paramétricos (orçamento/proposta/contrato) conectados aos briefings.
- Basear textos e nomenclaturas nos copies e fluxos do site (siteapp-main).

## Arquitetura & Ordem Lógica
- Pastas raiz (ordem): `Empresa/`, `Negócios/`, `Comercial/`, `Pricing/`, `Templates/`, `Dashboards/`, `Glossário/`, `Aprendizado/`, `Vida/`, `Assets/`, `SFINACAS/`, `.obsidian/`.
- MOCs por área: `Empresa/Index.md`, `Negócios/Index.md`, `Comercial/Index.md`, conectando às notas-chave e dashboards (`Dashboards/Empresa.md`, `Dashboards/Comercial.md`).

## Sistema Visual (Dracula Mono)
- CSS snippet complementar: cabeçalhos de nota, blocos de "Modo de Uso", callouts e tabelas estilizadas (monocromático em Dracula). Integração com classes de Supercharged Links já existentes (`.obsidian/plugins/supercharged-links-obsidian/data.json`).
- Ícones: usar Lucide padronizado via classes (mono), sem cores saturadas; mapear tipos (briefing, orçamento, proposta, contrato, cliente, serviço).
- Embeds: adicionar PNGs ilustrativos em `Assets/` e referenciar com `![[...]]` nas notas.

## Templates Especialistas
- Cabeçalho padrão em todos: título, propriedades, meta; seções iniciais: "O que é", "Para que serve", "Como usar".
- Briefings avançados por serviço (Archviz, CGI/VFX, Branding, VJing): campos técnicos (parâmetros, complexidade, revisões), entregáveis, critérios de aceitação, riscos, qualidade, pipeline.
- Correlatos: serviço principal + upsells (animação, pós, manual de marca, loops), com links sugeridos.
- Tipos de cliente: Segmentação (Residencial, Comercial, Agência, Produtora, Evento), políticas de precificação e negociação.

## Geração Comercial Paramétrica
- Meta‑template "Gerar Proposta Integrada" (já criado) evoluído para:
  - Ler briefing aberto (cliente, projeto, `service_category`) automaticamente.
  - Consultar `Pricing/*` conforme serviço; aplicar multiplicadores (revisões, complexidade, resolução/duração).
  - Gerar trio: `Orçamento` (tabela detalhada), `Proposta` (layout diagramado com callouts) e `Contrato` (cláusulas), com visualização final elegante.
- Saída: documento com tabelas estilizadas, callouts de termos e blocos de assinatura; pronto para exportar em PDF.

## Dashboards Aprimorados
- Comercial: propostas por status/validade, orçamentos em revisão, contratos pendentes; alertas (prazo próximo, validade expirada).
- Empresa: atalhos, status de portfólio e contatos; links para serviços.

## Assets
- Adicionar pasta `Assets/` com ícones PNG monocromáticos (serviços, documento, cliente) e imagens ilustrativas; embutir em notas.

## Base no Backend do Site
- Textos e nomenclaturas dos serviços, CTA, indicadores e rotas extraídos de:
  - `siteapp-main/siteapp-main/app-guide.md` (rotas e descrições)
  - `src/components/home/HeroSection.tsx`, `DynamicServicesSection.tsx`, `ContactSection.tsx`, `StatsSection.tsx`
  - `src/components/quote/*` e hooks (nomes de campos/multiplicadores)

## Implementação (Passos)
1) Criar MOCs e reordenar atalhos em `Dashboards/*`; adicionar blocos explicativos.
2) Expandir templates com cabeçalhos, "Modo de Uso", campos especialistas e correlações; inserir embeds PNG.
3) Atualizar snippet CSS com blocos de nota, tabelas e callouts (Dracula mono).
4) Evoluir meta‑template: auto‑preenchimento via briefing; aplicar `Pricing/*` e multiplicadores; gerar trio documentos linkados.
5) Criar exemplos completos por serviço; validar consultas Dataview e visualização.

## Entregáveis
- Novos/atualizados: `Empresa/Index.md`, `Negócios/Index.md`, `Comercial/Index.md`, `Assets/*`, templates enriquecidos, meta‑templates evoluídos, CSS snippet e dashboards incrementados.

## Próximo
- Com a sua aprovação, executo a refatoração visual, estrutural e funcional, adiciono os assets, amplio templates e meta‑templates, e conecto tudo para gerar saídas diagramadas perfeitas a partir dos briefings.