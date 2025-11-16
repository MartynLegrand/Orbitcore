## Objetivos
- Criar um sistema de briefing profissional completo com templates específicos por serviço.
- Garantir padronização de nomenclatura, estrutura de pastas, propriedades e documentação técnica.
- Base visual: tema Dracula com estética profissional e recursos avançados de embed/visualização.
- Integração com PKM: glossário técnico, links bidirecionais e dashboards por área/categoria.

## Padrão & Nomenclatura
- Estrutura: `Negócios/Serviços/Briefings/<Categoria>/` e `Templates/Briefings/`.
- Nome de nota: `BRF - <Categoria> - <Cliente> - <PROJ> - <YYYY-MM-DD>`.
- Propriedades comuns: `type: briefing`, `area: negocios`, `service_category`, `cliente`, `projeto`, `status`, `prioridade`, `prazo`, `orcamento`, `stakeholders[]`, `tags[]`.
- Vinculação: `[[Glossário/<Termo>]]` para termos técnicos; backlinks obrigatórios para `Negócios/Serviços/Index.md`.

## Plugins & Recursos
- Core: Dataview/DataviewJS, Templater, QuickAdd, Supercharged Links, Tasks, Kanban, Excalidraw, Media Extended, Advanced Tables, Admonition, Iconize, Style Settings.
- Visual: Tema Dracula (complementado por Style Settings) + snippet CSS para ícones/embeds/código.
- Dashboards: consultas Dataview e gráficos com Charts/Tracker para status/KPIs.

## Tema & Visual
- Ativar "Dracula" como tema base.
- Ajustar contrastes e code blocks via Style Settings.
- Snippet `trae.css` sobre Dracula: variáveis de cor, ícones por classe (links de `type: briefing` e `service_category`), embeds responsivos e captions.

## Templates por Serviço
- Comuns (seções): Objetivos, Escopo, Requisitos Técnicos, Pipeline, Assets, Cronograma, Aprovações, Entregáveis, Riscos, KPIs, Referências, Anexos/Embeds, Notas.
- Mapas 3D para eventos: `venue`, `capacidade`, `zonas`, `fluxo_publico`, `iluminacao`, `som`, `seguranca`, `render_engine`, `file_formats`, `review_milestones`.
- Arquitetura e ArqVis: `modelo_bim`, `fase`, `materialidade`, `views[]` (planta/cortes/fachadas), `renderer`, `texturas`, `lotes_entrega`.
- Marketing e Comunicação: `campanha`, `publico_alvo`, `canais[]`, `kpis[]`, `cronograma`, `brand_guidelines`, `assets[]`.
- Criação Publicitária 3D: `roteiro`, `storyboard`, `animatica`, `duracao`, `fps`, `pipeline`, `render_farm`.
- Consultorias: `escopo`, `diagnostico`, `metodologia`, `sprints[]`, `indicadores[]`, `deliverables[]`.
- VFX e CGI: `shots[]`, `plates[]`, `tracking`, `simulacoes[]`, `composicao`, `software[]`, `deadline`, `references[]`.
- Aceleração de Negócios: `modelo_negocio`, `hipoteses[]`, `okrs[]`, `experimentos[]`, `metricas[]`, `funnel`, `roadmap`.
- Desenvolvimento de Sites e APPs: `stack`, `features[]`, `arquitetura`, `ambiente`, `deploy`, `design_system`, `acessibilidade`, `qa_plan`, `repos[]`.
- Sistemas Aplicativos: `dominio`, `casos_uso[]`, `req_funcionais[]`, `req_nao_funcionais[]`, `integracoes[]`, `modelo_dados`, `seguranca`, `sla`, `observabilidade`.

## Embed & Visualização
- Imagens/Vídeos: usar `![[...]]` com Media Extended para players e controles; captions padronizadas.
- Diagramas: Excalidraw para fluxos/pipelines; anexar dentro da nota do briefing.
- Tabelas: Advanced Tables para edição; Dataview para visões dinâmicas.

## Padronização de Tags & Links
- Tags: `#briefing`, `#servico/<categoria>`, `#cliente/<nome>`, `#status/<fase>`.
- Links: sempre apontar para `Projeto` e `Cliente`; links para `Glossário` em termos técnicos.
- Supercharged Links: estilos por `type: briefing` e `service_category` (cores/ícones).

## Meta‑Documentação
- Para cada template: bloco “Manual do Template” explicando cada propriedade, exemplos de preenchimento e critérios de qualidade.
- Guia geral: "Guia de Utilização do Sistema" cobrindo criação via QuickAdd, preenchimento, uso de embeds, dashboards e revisão.
- Documentação técnica: referência de propriedades, consultas Dataview e classes CSS usadas.

## Automação
- QuickAdd: macro "Novo Briefing" que pede `Categoria/Cliente/Projeto/Prazo/Orçamento` e instancia o template correto.
- Templater: preenchimento de datas, criação de seções condicionais por categoria.
- Tasks/Kanban: gerar tarefas de milestones a partir do briefing; quadro por projeto.

## Dashboards
- `Dashboards/Serviços.md`: lista de briefings por `service_category`, status e prazo; gráficos de KPIs principais.
- `Dashboards/Negócios.md`: pipeline de serviços em execução, orçamento agregado, próximos marcos.

## Testes & Validação
- Criar notas de exemplo por categoria; validar render de embeds e consultas.
- Conferir Supercharged Links e ícones por categoria; revisar legibilidade com Dracula.

## Entregáveis
- Templates completos por categoria em `Templates/Briefings/` com meta‑documentação embutida.
- Documentação técnica detalhada e Guia de Utilização.
- Configurações visuais padronizadas (tema Dracula + snippet CSS).
- Dashboards Dataview e gráficos de KPIs.

## Passos de Execução
- Instalar/ativar plugins e tema Dracula; aplicar Style Settings.
- Criar `trae.css` e ativar snippet; mapear classes por `service_category`.
- Montar templates por categoria e macro QuickAdd; construir dashboards.
- Gerar exemplos e validar; ajustar finos conforme feedback.

## Próximo
- Ao aprovar, implemento os templates, automações, dashboards e configurações, entregando um vault pronto e testado.