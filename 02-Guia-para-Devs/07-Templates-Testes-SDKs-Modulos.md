# Templates de Testes (SDKs e Módulos)

## SDK (TypeScript)
- Ferramentas: Vitest/Jest.
- Testes: sucesso, erro (`status:error`), timeouts/retries.

```ts
import { describe, it, expect } from 'vitest'
import { AuthClient } from '@obm/auth-sdk'

describe('AuthClient', () => {
  it('login success', async () => {
    const c = new AuthClient({ baseUrl: 'http://localhost:3001' })
    const d = await c.login('user@example.com','secret')
    expect(d.token).toBeDefined()
  })
})
```

## SDK (Python)
- Ferramentas: pytest.
- Testes: sucesso, erro, contratos.

```python
from obm_auth_sdk import AuthClient

def test_login_success():
    c = AuthClient('http://localhost:3001')
    d = c.login('user@example.com','secret')
    assert 'token' in d
```

## Módulos (API)
- Testes e2e por rota (latência, códigos, payloads).
- Cobrir idempotência e paginação.