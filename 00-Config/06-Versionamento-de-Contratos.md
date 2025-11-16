# Versionamento de Contratos 🔁

## Padrões
- Caminho: `/api/v1/...` (incrementar para `v2` quando houver breaking changes).
- Deprecações: anunciar em changelog e manter período de transição.
- Compatibilidade: evitar quebra silenciosa; retornar erros claros.

## Processo
- Propor mudanças com notas de impacto.
- Validar em staging com SDKs e consumidores principais.
- Publicar changelog e janelas de migração.

## Changelog (modelo)
```md
## v1.1
- Adicionado campo `expiresIn` em /auth/login.
## v2.0 (breaking)
- Alterado schema de /payments/charge; removido `methodId`.
```

> [!warning] Governança
> Não quebrar contratos sem transição; sempre documentar e versionar adequadamente.
