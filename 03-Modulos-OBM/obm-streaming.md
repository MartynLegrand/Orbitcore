# obm-streaming 🎵

## 1. Objetivo do módulo
- Streaming de áudio/vídeo sob demanda.
- DRM, playlists e qualidade adaptativa.

## 2. Contrato com o core (`{{APP_ORBIT_SUITE}}`)

### 2.1. APIs REST
- `GET /api/streaming/tracks`
- `POST /api/streaming/play`
- `GET /api/streaming/playlist`

## 4.1. Contrato de API – Exemplos
> Segue [[00-Config/05-Protocolo-Orbit-OBM]].

### Play
Request:
```json
{ "trackId": "t_1", "quality": "auto", "drmToken": "..." }
```
Response (200):
```json
{ "status": "success", "data": { "streamUrl": "https://cdn/...", "expiresIn": 300 }, "meta": { "version": "v1", "traceId": "uuid", "timestamp": "..." } }
```

### Playlist
Request: `GET /api/streaming/playlist?id=pl_1`
Response (200):
```json
{ "status": "success", "data": { "items": [{ "id": "t_1" }] }, "meta": { "version": "v1", "traceId": "uuid", "timestamp": "..." } }
```

## 4.2. DRM
- Token de acesso curto; verificação no edge.
- Preferir padrões interoperáveis; logs e métricas de acesso.

## 4.3. Diagrama de Sequência – Play
```mermaid
sequenceDiagram
  participant C as Client
  participant S as obm-streaming
  participant CDN as CDN/DRM
  C->>S: POST /api/streaming/play { trackId, quality, drmToken }
  S->>S: valida drmToken e assinatura
  S->>CDN: requisita URL com DRM
  CDN-->>S: signed stream URL
  S-->>C: 200 { streamUrl, expiresIn }
  C->>CDN: GET streamUrl
  CDN-->>C: stream chunks
```

### 4.4. Diagrama de Sequência – Playlist
```mermaid
sequenceDiagram
  participant C as Client
  participant S as obm-streaming
  participant DB as Database
  C->>S: GET /api/streaming/playlist?id=pl_1
  S->>DB: busca playlist e tracks
  DB-->>S: playlist data
  S->>S: aplica filtros por assinatura
  S-->>C: 200 { items: [tracks] }
```

### 4.5. Diagrama de Sequência – Qualidade Adaptativa
```mermaid
sequenceDiagram
  participant C as Client
  participant S as obm-streaming
  participant CDN as CDN
  C->>S: GET /api/streaming/play/{trackId}
  S-->>C: manifesto com múltiplas qualidades
  C->>CDN: GET chunk_720p
  CDN-->>C: chunk data
  C->>C: detecta queda de bandwidth
  C->>CDN: GET chunk_480p
  CDN-->>C: chunk data
```

### 2.2. SDK
```ts
import { Streaming } from "@obm/streaming-sdk";
await Streaming.play({ trackId, quality });
```

## 3. Configuração
- `.env`: `CDN_URL`, `DRM_PROVIDER`, `ANALYTICS_URL`.

## 4. Fluxos principais
- Playback, playlist, coleta de telemetry.

## 5. Checklists
- Autorização por assinatura, limites de bitrate, integração com `obm-analytics`.