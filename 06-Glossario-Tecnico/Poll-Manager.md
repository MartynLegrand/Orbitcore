# Poll Manager ⏱️

**O que é:**
Componente de orquestração que coordena polling/ciclos de verificação de estado.

**Por que importa aqui:**
Alguns fluxos dependem de verificação periódica (ex.: status de provider) além de eventos.

**Exemplo prático:**
- Polling de `payment.status` até `succeeded` com backoff.

**Como pedir para a IA:**
> "Implementar Poll Manager para orquestrar verificação de status com retries e limites."

**Relacionados:**
- [[03-Modulos-OBM/obm-orchestrator]]
- [[06-Glossario-Tecnico/BullMQ]]