# obm-notifications 🔔

## 1. Objetivo do módulo
- Enviar notificações (email, push, SMS).
- Preferências e templates.

## 2. Contrato com o core (`{{APP_ORBIT_SUITE}}`)

### 2.1. APIs REST
- `POST /api/notify/send`
- `GET /api/notify/preferences`

### 2.2. SDK
```ts
import { Notify } from "@obm/notifications-sdk";
await Notify.send({ channel: "email", to, templateId, data });
```

## 3. Configuração
- `.env`: `SMTP_URL`, `PUSH_KEY`, `SMS_PROVIDER_KEY`.

## 4. Fluxos principais
- Envio, preferências, templates.

## 4.1. Contrato de API – Exemplos
> Segue [[00-Config/05-Protocolo-Orbit-OBM]].

### Send
Request:
```json
{
  "channel": "email",
  "to": "user@example.com",
  "templateId": "welcome",
  "data": { "name": "User" },
  "idempotencyKey": "idem-uuid"
}
```
Response (200):
```json
{ "status": "success", "data": { "messageId": "msg_123" }, "meta": { "version": "v1", "traceId": "uuid", "timestamp": "..." } }
```

### Preferences
Request: `GET /api/notify/preferences?userId=u_123`
Response (200):
```json
{ "status": "success", "data": { "channels": { "email": true, "sms": false, "push": true } }, "meta": { "version": "v1", "traceId": "uuid", "timestamp": "..." } }
```

## 5. Checklists
- Opt-in/out, logs, retries.
 - Seguir [[00-Config/05-Protocolo-Orbit-OBM]] e padronizar erros.
