# Mapa Geral do Ecossistema Orbit Corp / OBM

## Visão de Alto Nível
- Ecossistema modular baseado em `obm-*` (módulos plugáveis, contratos claros).
- Integração com `{{APP_ORBIT_SUITE}}` como core orquestrador.
- Conexões por `REST`, `SDK` e filas.

```mermaid
flowchart LR
  Core[{{APP_ORBIT_SUITE}} Core] -->|HTTP (REST)| AUTH[obm-auth 🔐]
  Core -->|HTTP (REST)| CHAT[obm-chat 🧩]
  Core -->|Fila/Eventos| ORCH[obm-orchestrator ⚙️]
  Core -->|HTTP (REST)| PAY[obm-payments 💰]
  Core -->|HTTP (REST)| NOTIFY[obm-notifications 🔔]
  Core -->|HTTP (REST)| ANALYTICS[obm-analytics 📊]
```

> [!warning] Padrão de Nomes
> Nunca use prefixo “martyn” em nomes de módulos. O padrão oficial é `obm-*`.

## Links Úteis
- [[03-Modulos-OBM/obm-auth]]
- [[03-Modulos-OBM/obm-chat]]
- [[03-Modulos-OBM/obm-orchestrator]]
- [[03-Modulos-OBM/obm-payments]]
- [[03-Modulos-OBM/obm-notifications]]
- [[03-Modulos-OBM/obm-analytics]]
- [[01-Visao-Geral/03-Modulos-OBM-Visao-Geral]]