## Objetivo
- Abrir `c:\Users\lucas\Documents\GitHub\DEVVAULT\siteapp-main.zip`, extrair textos institucionais da empresa e organizá-los no vault seguindo o padrão já aplicado (O que é/Para que serve/Como usar).

## O que vou buscar
- Identidade: Sobre, missão, visão, proposta de valor, tone of voice.
- Serviços: categorias, descrições, diferenciais, listas de oferta.
- Portfólio/Projetos: cases, resultados, imagens, créditos.
- Clientes/Setores: depoimentos, logos, segmentos atendidos.
- Contato: canais, endereço, equipe.
- Blog/News: artigos, atualizações.

## Passos
1. Extrair `siteapp-main.zip` para `siteapp-main/` sem modificar arquivos originais.
2. Varredura de conteúdo:
   - Procurar `README.md`, `ABOUT.md`, `docs/`, `content/`, `public/`, `src/pages/`, `data/*.json`.
   - Ler `.md`, `.html`, `.json` com textos.
3. Compilar um resumo fiel do conteúdo encontrado com citações de arquivo/linha.
4. Organizar no vault:
   - `Empresa/Sobre.md`, `Empresa/Serviços.md`, `Empresa/Portfólio.md`, `Empresa/Clientes.md`, `Empresa/Contato.md`, `Empresa/News.md`.
   - Cada nota com seções “O que é / Para que serve / Conteúdo extraído”.
5. Conectar aos dashboards existentes (Negócios, Social, OKRs) e templates de Briefing/Proposta.

## Entregáveis
- Notas estruturadas em `Empresa/` com conteúdo extraído e referências.
- Lista de fontes (arquivos e trechos) usados na extração.
- Opcional: painel `Dashboards/Empresa.md` agregando serviços/cases.

## Segurança
- Ignorar qualquer segredo/credencial no zip. Não armazenar tokens no vault.

## Próximo
- Ao aprovar, executo a extração, faço a leitura, trago o resumo e crio as notas estruturadas no vault para sua revisão.