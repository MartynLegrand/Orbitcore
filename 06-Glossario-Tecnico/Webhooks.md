# Webhooks 🔔

**O que é:**
Chamadas HTTP de saída para notificar eventos.

**Por que importa aqui:**
Integrações externas (payments, notificações) dependem de verificação de assinatura.

**Exemplo prático:**
- `POST /api/payments/webhook` com HMAC e verificação de replay.

**Como pedir para a IA:**
> "Implementar verificação de assinatura e proteção contra replay em webhooks." 

**Referências:**
- [[03-Modulos-OBM/obm-payments]]