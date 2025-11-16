## Objetivo
- Aplicar ícones mono via frontmatter em notas principais e índices (Dracula), manter regras do Iconize.
- Adicionar blocos "Modo de Uso" (note-usage) nos templates comerciais (Orçamento/Proposta/Contrato) com passos claros.
- Inserir banners/imagens ilustrativas nas notas principais usando PNGs do siteapp-main.

## Escopo
- Notas: Empresa/Sobre, Serviços, Portfólio, Contato; Índices: Empresa/Index, Negócios/Index, Comercial/Index.
- Comerciais: Comercial/Templates/Orcamento.md, Proposta.md, Contrato.md.
- Geradores: manter em Painéis-Geradores com nomes "GERADOR - ...".

## Passos
1) Atualizar frontmatters com `icon: lucide-*` coerente por tipo.
2) Incluir seções "note-usage" com instruções passo-a-passo nos templates comerciais.
3) Embutir banners/imagens PNG do siteapp-main nas notas para reforçar IUX.
4) Confirmar QuickAdd aponta para geradores com timestamp para evitar sobreescrita.

## Resultados
- Notas com ícones mono, uso guiado e visual melhorado.
- Geração sempre cria nova nota (nome com data+hora).

## Segurança
- Sem segredos; apenas conteúdo visual e metadados.

## Próximo
- Ao aprovar, aplico os ícones e blocos de uso e adiciono os banners nas notas alvo.