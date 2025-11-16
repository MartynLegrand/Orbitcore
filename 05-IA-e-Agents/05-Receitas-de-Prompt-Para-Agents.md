# Receitas de Prompt Para Agents 🍳

## 1. Criar um novo módulo OBM do zero
> [!example]
> 1. Architect: "Quero `obm-billing` responsável por... gere `ARCHITECTURE.md` e `PLAN.md`."
> 2. Dev: "Implemente `PLAN.md` usando Stack Oficial OBM/Orbit, Docker e testes."
> 3. Executor: "Revisar segurança, performance e cobertura de testes; proponha otimizações."

### Template de Prompt – Criar Módulo
```md
Crie {{MODULE_NAME}} no domínio {{MODULE_DOMAIN}} com API REST completa (v1), SDK {{SDK_PACKAGE_NAME}}, orquestração via {{POLL_MANAGER}}, integração com obm-auth, obm-chat, obm-orchestrator, obm-payments, obm-notifications, obm-analytics, obm-nft-marketplace, segurança e compatibilidade com qualquer core ({{BASE_URL}}). Entregue ARCHITECTURE.md, API_CONTRACT.md, DATA_MODEL.md, SDK.md, ORCHESTRATION.md, INTEGRATIONS.md, SECURITY_COMPAT.md, TESTING.md, OBSERVABILITY.md, DEPLOY.md. Use wikilinks e placeholders da [[00-Config/00-Placeholders]]. Valide com testes e critérios detalhados.
```

## 2. Criar um novo app usando módulos existentes
- Descrever app com placeholders de módulos OBM.
- Solicitar geração de backend/frontend e documentação.

## 3. Tasks (Trae) e Paralelismo
- `.task` = unidade atômica com objetivo, entradas e saídas.
- Criar tasks paralelas independentes: ingestão, glossário, scaffold de módulos, receitas, histórico.

### Exemplos de Tasks
- "Ler `CHATS REFERENCIA...` e extrair termos e módulos → gerar lista priorizada."
- "Gerar notas de glossário com exemplos e prompts."
- "Escrever templates em `03-Modulos-OBM/` com contratos e SDKs."
- "Compilar `Guia-Anti-Erros` e checklists."
- "Montar `Linha-do-Tempo` com marcos e lições."

## 4. Auto-Limpeza e Plugins
- Task: validar wikilinks, remover órfãos, otimizar imagens, reconstruir índices.
- Plugins: Dataview, Templater, Advanced Tables, Mermaid (documentar configs).

## 5. Verificação
- Task de auditoria: garantir termos linkados, contratos completos, checklists presentes, reportar lacunas.