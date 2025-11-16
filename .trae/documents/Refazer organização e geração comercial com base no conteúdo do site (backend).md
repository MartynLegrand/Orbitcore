## Objetivo
- Refazer as notas/meta‑templates no DEVVAULT estritamente baseadas nos textos/copies e conteúdo presentes no código do site (siteapp-main), refletindo exatamente o que você faz.
- Conectar briefings aos módulos comerciais para gerar orçamento, proposta e contrato automaticamente, com valores e termos alinhados ao que está descrito nas calculadoras e fluxos do app.

## Fontes a extrair
- Guia do app: `app-guide.md` (rotas, serviços, mensagens, indicadores).
- Componentes de Home: `HeroSection.tsx`, `DynamicServicesSection.tsx`, `ContactSection.tsx`, `StatsSection.tsx` (copys e CTAs).
- Calculadoras e orçamentos: `src/components/quote/*` e hooks `useMultiplierCalculation.tsx`, `useCalculatorSettings.tsx`, `useDynamicServices.tsx`.
- Páginas: `pages/*` (Admin/Dashboard/Quote) para nomes, estados e descrições.
- Supabase functions (somente para entender nomenclaturas: `generate-budget-pdf`, `process-notifications`).

## Entregáveis
- Empresa:
  - Atualizar `Empresa/Sobre.md`, `Empresa/Serviços.md`, `Empresa/Portfólio.md`, `Empresa/Contato.md` com copys e dados exatos do site.
- Comercial:
  - Templates: `Comercial/Templates/Orcamento.md`, `Proposta.md`, `Contrato.md` refletindo terminologias do app (budgets, contracts, projects, notification templates).
  - Meta‑template: `Comercial/_Meta/Gerar Proposta.tmpl.md` que:
    - Lê Briefing (service_category, escopo, parâmetros) e consulta tabelas de pricing derivadas dos arquivos das calculadoras.
    - Gera orçamento (itens + multiplicadores), proposta (escopo + termos + valores) e contrato (cláusulas) com links.
- Pricing:
  - `Pricing/archviz.md`, `Pricing/cgi-vfx.md`, `Pricing/branding.md`, `Pricing/vjing.md` com níveis e multiplicadores baseados nos componentes e hooks das calculadoras; faixas de preço ajustáveis.
- Dashboards:
  - `Dashboards/Comercial.md` agregando propostas, contratos e orçamentos; filtros por serviço/cliente/status.

## Método
1) Ler e extrair copys e descrições do site: títulos, subtítulos, indicadores, CTAs, descrições de serviço.
2) Ler calculadoras e hooks para mapear campos e multiplicadores; criar tabelas de pricing no vault com explicação simples.
3) Atualizar/gerar notas e templates no padrão “O que é/Para que serve/Como usar”.
4) Criar macro/meta‑template que, ao selecionar um briefing, gere orçamento + proposta + contrato com links cruzados e termos de pagamento.

## Segurança
- Não capturar nem armazenar segredos/tokens.
- Apenas textos e estruturas funcionais/copys do site.

## Próximo
- Ao aprovar, executo a extração detalhada, atualizo as notas e crio os templates/meta‑templates e dashboards comerciais ligados aos briefings, tudo baseado estritamente no conteúdo do site.