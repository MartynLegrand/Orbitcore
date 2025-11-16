# Frontend React (Next.js) 🖥️

## Estrutura
- App Router/Pages.
- SSR/SSG conforme necessidade.
- Integração com SDKs dos módulos `obm-*`.

## Boas Práticas
- Estado gerenciado (ex.: TanStack Query/Zustand).
- Componentização e acessibilidade.
- Testes com Playwright/Jest.

## Exemplo
```ts
import { AuthClient } from '@obm/auth-sdk'
export default async function Page() { /* ... */ }
```

## Autenticação
- Padrão oficial: `NextAuth` integrando [[03-Modulos-OBM/obm-auth]].
- Alternativa suportada: `Lucia` quando requisitos pedirem.
- Tokens e refresh padronizados por [[00-Config/05-Protocolo-Orbit-OBM]] e [[06-Glossario-Tecnico/JWT]].