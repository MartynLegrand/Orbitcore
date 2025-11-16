# SDK 🧩

**O que é:**
Biblioteca cliente que facilita uso das APIs de um módulo.

**Por que importa aqui:**
Padroniza integração entre apps e módulos OBM.

**Exemplo prático:**
```ts
import { AuthClient } from "@obm/auth-sdk";
await AuthClient.login(email, password);
```

**Como pedir para a IA:**
> "Crie um SDK TS para `obm-chat` com métodos `sendMessage`, `listChannels`." 

**Ferramentas comuns:**
- TypeScript, npm packages

**Referências:**
- [[03-Modulos-OBM/obm-chat]]