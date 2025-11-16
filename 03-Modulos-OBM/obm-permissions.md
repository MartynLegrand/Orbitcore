# obm-permissions 🛡️

## 1. Objetivo do módulo
- Gestão de roles e permissões (RBAC).
- Feature flags e políticas.

## 2. Contrato com o core (`{{APP_ORBIT_SUITE}}`)

### 2.1. APIs REST
- `GET /api/permissions/roles`
- `POST /api/permissions/assign`
- `GET /api/permissions/policies`

## 4.1. Contrato de API – Exemplos
> Segue [[00-Config/05-Protocolo-Orbit-OBM]].

### Roles
Request: `GET /api/permissions/roles`
Response (200):
```json
{ "status": "success", "data": { "roles": ["user", "admin"] }, "meta": { "version": "v1", "traceId": "uuid", "timestamp": "..." } }
```

### Assign
Request:
```json
{ "userId": "u_1", "role": "admin", "idempotencyKey": "idem-uuid" }
```
Response (200):
```json
{ "status": "success", "data": { "assigned": true }, "meta": { "version": "v1", "traceId": "uuid", "timestamp": "..." } }
```

### Policies
Request: `GET /api/permissions/policies?role=admin`
Response (200):
```json
{ "status": "success", "data": { "policies": [{ "resource": "orders", "action": "read" }] }, "meta": { "version": "v1", "traceId": "uuid", "timestamp": "..." } }
```

## 4.2. Testes RBAC
- Cobrir guards e escopos em endpoints críticos.

### 4.3. Diagrama de Sequência – Assign Role
```mermaid
sequenceDiagram
  participant C as Client
  participant P as obm-permissions
  participant DB as Database
  participant A as obm-auth
  C->>P: POST /api/permissions/assign { userId, role }
  P->>A: verifica permissões do solicitante
  A-->>P: confirma autorização
  P->>DB: atribui role ao usuário
  DB-->>P: confirmação
  P->>P: atualiza cache de permissões
  P-->>C: 200 { assigned: true }
```

### 4.4. Diagrama de Sequência – Check Policy
```mermaid
sequenceDiagram
  participant C as Client
  participant P as obm-permissions
  participant DB as Database
  participant FF as Feature Flags
  C->>P: GET /api/permissions/policies?role=admin
  P->>DB: busca políticas da role
  DB-->>P: lista de políticas
  P->>FF: verifica feature flags ativas
  FF-->>P: flags ativas
  P->>P: combina políticas + flags
  P-->>C: 200 { policies: [...] }
```

### 4.5. Diagrama de Sequência – Authorization Check
```mermaid
sequenceDiagram
  participant S as Service
  participant P as obm-permissions
  participant DB as Database
  participant A as obm-analytics
  S->>P: check(userId, resource, action)
  P->>DB: busca roles e políticas do user
  DB-->>P: roles e políticas
  P->>P: avalia políticas
  P->>A: registra evento de autorização
  P-->>S: true/false
```

### 2.2. SDK
```ts
import { Permissions } from "@obm/permissions-sdk";
await Permissions.assign({ userId, role });
```

## 3. Configuração
- `.env`: `RBAC_MODEL`, `FEATURE_FLAGS_SOURCE`.

## 4. Fluxos principais
- Atribuição de roles, verificação de políticas, flags dinâmicas.

## 5. Checklists
- Integração com [[03-Modulos-OBM/obm-auth]], auditoria e testes de autorização.