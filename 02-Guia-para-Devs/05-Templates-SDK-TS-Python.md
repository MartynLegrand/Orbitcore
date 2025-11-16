# Templates de SDK (TS/Python) 🧩

## TypeScript
```ts
export class BaseClient {
  constructor(private baseUrl: string, private token?: string) {}
  async request(path: string, init?: RequestInit) {
    const headers: Record<string, string> = { 'Content-Type': 'application/json' };
    if (this.token) headers['Authorization'] = `Bearer ${this.token}`;
    const res = await fetch(`${this.baseUrl}${path}`, { ...init, headers });
    const body = await res.json();
    if (body.status === 'error') throw new Error(body.error?.code || 'ERROR');
    return body.data;
  }
}

export class AuthClient extends BaseClient {
  async login(email: string, password: string) {
    return this.request('/api/auth/login', { method: 'POST', body: JSON.stringify({ email, password }) });
  }
  async me() { return this.request('/api/auth/me'); }
}
```

## Python
```python
import requests

class BaseClient:
    def __init__(self, base_url: str, token: str | None = None):
        self.base_url = base_url
        self.token = token
    def request(self, path: str, method: str = 'GET', json: dict | None = None):
        headers = { 'Content-Type': 'application/json' }
        if self.token: headers['Authorization'] = f'Bearer {self.token}'
        resp = requests.request(method, f'{self.base_url}{path}', json=json, headers=headers)
        body = resp.json()
        if body.get('status') == 'error':
            raise Exception(body.get('error', {}).get('code', 'ERROR'))
        return body.get('data')

class AuthClient(BaseClient):
    def login(self, email: str, password: str):
        return self.request('/api/auth/login', method='POST', json={ 'email': email, 'password': password })
    def me(self):
        return self.request('/api/auth/me')
```

> [!tip] Adapte
> Expanda métodos por módulo (`payments`, `notifications`, etc.) e padronize erros conforme o Protocolo Orbit OBM.
