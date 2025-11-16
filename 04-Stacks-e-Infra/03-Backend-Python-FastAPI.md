# Backend Python (FastAPI) 🐍

## Estrutura
- Routers, Models (Pydantic), Dependencies.
- Segurança com JWT, escopos e RBAC.

## Boas Práticas
- Tipagem clara e validação.
- Respostas padronizadas.
- Testes com pytest.

## Exemplo
```py
from fastapi import APIRouter
router = APIRouter()
@router.post('/auth/login')
async def login(payload: LoginDTO):
    return await service.login(payload)
```

## Checklists
- Segurança: [[07-Receitas-e-Playbooks/03-Checklist-Seguranca]].
- Escalabilidade: [[07-Receitas-e-Playbooks/04-Checklist-Escalabilidade]].