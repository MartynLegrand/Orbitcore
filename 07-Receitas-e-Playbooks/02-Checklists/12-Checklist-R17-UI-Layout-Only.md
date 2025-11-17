# Checklist: R17 - Alterações UI/Layout Only

**Regra:** IA pode alterar APENAS UI/Layout (HTML/JSX, CSS/Tailwind). Proibido alterar lógica, hooks, API calls, renomear props.

**Versão:** 1.0  
**Última atualização:** 2025-11-16

---

## 📋 Checklist Completo

### 1. Separação de Responsabilidades

#### 1.1 O que é UI/Layout (✅ PERMITIDO)
- [ ] HTML/JSX estrutura (divs, sections, articles)
- [ ] Classes CSS/Tailwind (text-xl, bg-blue-500, flex)
- [ ] Estilos inline (quando necessário)
- [ ] Atributos visuais (className, style, aria-label)
- [ ] Ordem de elementos no DOM
- [ ] Responsividade (md:, lg:, hidden, block)
- [ ] Animações CSS puras (transitions, animations)
- [ ] Ícones e assets visuais

#### 1.2 O que é Lógica (❌ PROIBIDO)
- [ ] Funções JavaScript/TypeScript
- [ ] Hooks (useState, useEffect, useCallback, useMemo)
- [ ] Event handlers logic (onClick content, onChange logic)
- [ ] API calls (fetch, axios, tRPC)
- [ ] Estado local ou global
- [ ] Validações de dados
- [ ] Transformações de dados
- [ ] Props interface/types
- [ ] Routing logic

---

### 2. Marcadores de Código

#### 2.1 Uso de Marcadores (Recomendado)
```tsx
export function UserProfile({ user }: Props) {
  // LAYOUT_START - Safe to modify by AI
  return (
    <div className="flex flex-col gap-4 p-6">
      <h1 className="text-2xl font-bold">{user.name}</h1>
      <p className="text-gray-600">{user.email}</p>
    </div>
  );
  // LAYOUT_END
}
```

#### 2.2 Checklist de Marcadores
- [ ] LAYOUT_START/LAYOUT_END usado em componentes visuais?
- [ ] Lógica está FORA dos marcadores?
- [ ] Marcadores não quebram sintaxe?
- [ ] Documentação explica marcadores?

---

### 3. Validação de Alterações UI

#### 3.1 Antes de Modificar
- [ ] Identificar se é APENAS visual?
- [ ] Não há lógica misturada no componente?
- [ ] Props não precisam mudar?
- [ ] Sem necessidade de novos hooks?
- [ ] Sem necessidade de API calls?

#### 3.2 Durante Modificação
- [ ] Modificou APENAS HTML/JSX?
- [ ] Modificou APENAS classes CSS?
- [ ] NÃO alterou props?
- [ ] NÃO alterou tipos/interfaces?
- [ ] NÃO adicionou/removeu hooks?
- [ ] NÃO alterou event handlers logic?

#### 3.3 Após Modificação
- [ ] Diff mostra APENAS alterações visuais?
- [ ] Testes não quebram?
- [ ] Funcionalidade permanece igual?
- [ ] Props continuam iguais?
- [ ] Tipos continuam válidos?

---

### 4. Padrões de Separação

#### 4.1 Componente Bem Separado (✅ IDEAL)

```tsx
// hooks/useUserData.ts (LÓGICA - NÃO TOCAR)
export function useUserData(userId: string) {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchUser(userId).then(setUser).finally(() => setLoading(false));
  }, [userId]);

  return { user, loading };
}

// components/UserProfile.tsx (VISUAL - PODE ALTERAR)
export function UserProfile({ userId }: Props) {
  const { user, loading } = useUserData(userId); // LÓGICA (não tocar)

  if (loading) return <LoadingSpinner />; // LÓGICA (não tocar)
  if (!user) return <ErrorMessage />; // LÓGICA (não tocar)

  // LAYOUT_START
  return (
    <div className="max-w-2xl mx-auto p-6">
      <div className="bg-white rounded-lg shadow-lg p-8">
        <div className="flex items-center gap-4 mb-6">
          <img 
            src={user.avatar} 
            alt={user.name}
            className="w-16 h-16 rounded-full"
          />
          <div>
            <h1 className="text-2xl font-bold text-gray-900">
              {user.name}
            </h1>
            <p className="text-gray-600">{user.email}</p>
          </div>
        </div>
        
        <div className="space-y-4">
          <div>
            <h2 className="text-lg font-semibold text-gray-800 mb-2">
              Bio
            </h2>
            <p className="text-gray-700">{user.bio}</p>
          </div>
        </div>
      </div>
    </div>
  );
  // LAYOUT_END
}
```

**Checklist:**
- [ ] Lógica extraída para custom hook? ✅
- [ ] Componente visual puro? ✅
- [ ] Marcadores LAYOUT_START/END presentes? ✅
- [ ] Fácil identificar o que pode modificar? ✅

---

#### 4.2 Componente Mal Separado (❌ EVITAR)

```tsx
// ❌ Lógica e UI misturadas
export function UserProfile({ userId }: Props) {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(`/api/users/${userId}`)
      .then(r => r.json())
      .then(setUser)
      .finally(() => setLoading(false));
  }, [userId]);

  const handleUpdate = async () => {
    await updateUser(user);
  };

  if (loading) return <div>Loading...</div>;

  return (
    <div className="p-4">
      <h1>{user.name}</h1>
      <button onClick={handleUpdate}>Update</button>
    </div>
  );
}
```

**Problemas:**
- ❌ useState/useEffect no componente visual
- ❌ API call direto no componente
- ❌ Event handler com lógica
- ❌ Impossível alterar apenas layout sem risco

---

### 5. Casos de Uso Comuns

#### 5.1 Alterar Espaçamento (✅ PERMITIDO)

**Antes:**
```tsx
<div className="p-4 gap-2">
  <h1 className="text-xl">Title</h1>
  <p>Content</p>
</div>
```

**Depois:**
```tsx
<div className="p-6 gap-4"> {/* Apenas classes alteradas ✅ */}
  <h1 className="text-2xl">Title</h1> {/* Apenas classes alteradas ✅ */}
  <p>Content</p>
</div>
```

**Validação:**
- [ ] Apenas className alterado? ✅
- [ ] Estrutura HTML igual? ✅
- [ ] Props iguais? ✅
- [ ] Sem alteração de lógica? ✅

---

#### 5.2 Reorganizar Elementos (✅ PERMITIDO)

**Antes:**
```tsx
<div>
  <Header />
  <Sidebar />
  <Content />
</div>
```

**Depois:**
```tsx
<div className="flex"> {/* Classe adicionada ✅ */}
  <Sidebar /> {/* Ordem alterada ✅ */}
  <div className="flex-1"> {/* Wrapper adicionado ✅ */}
    <Header />
    <Content />
  </div>
</div>
```

**Validação:**
- [ ] Componentes mantêm mesmas props? ✅
- [ ] Apenas estrutura HTML mudou? ✅
- [ ] Sem alteração de lógica? ✅

---

#### 5.3 Adicionar Responsividade (✅ PERMITIDO)

**Antes:**
```tsx
<div className="grid grid-cols-3 gap-4">
  {items.map(item => <Card key={item.id} {...item} />)}
</div>
```

**Depois:**
```tsx
<div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
  {/* Apenas classes Tailwind alteradas ✅ */}
  {items.map(item => <Card key={item.id} {...item} />)}
</div>
```

**Validação:**
- [ ] Apenas classes CSS alteradas? ✅
- [ ] map() não foi tocado? ✅
- [ ] Props de Card iguais? ✅

---

#### 5.4 Renomear Prop (❌ PROIBIDO)

**Antes:**
```tsx
interface Props {
  userName: string;
}

function User({ userName }: Props) {
  return <h1>{userName}</h1>;
}
```

**Depois (ERRADO):**
```tsx
interface Props {
  name: string; // ❌ PROIBIDO: alterou interface
}

function User({ name }: Props) { // ❌ PROIBIDO: alterou prop
  return <h1 className="text-2xl">{name}</h1>;
}
```

**Problema:**
- ❌ Alterou interface (quebra contrato)
- ❌ Alterou prop (breaking change)
- ⚠️ Mesmo adicionando classe CSS, a alteração de prop é proibida

**Correto:**
```tsx
interface Props {
  userName: string; // ✅ Mantém igual
}

function User({ userName }: Props) { // ✅ Mantém igual
  return <h1 className="text-2xl">{userName}</h1>; // ✅ Apenas classe CSS
}
```

---

#### 5.5 Alterar Event Handler (❌ PROIBIDO)

**Antes:**
```tsx
function Button({ onClick }: Props) {
  return (
    <button onClick={onClick}>
      Click me
    </button>
  );
}
```

**Depois (ERRADO):**
```tsx
function Button({ onClick }: Props) {
  const handleClick = () => { // ❌ PROIBIDO: lógica nova
    console.log('Clicked');
    onClick();
  };

  return (
    <button onClick={handleClick} className="bg-blue-500"> {/* Classe OK, handler ❌ */}
      Click me
    </button>
  );
}
```

**Problema:**
- ❌ Adicionou lógica (handleClick)
- ❌ Alterou behavior (console.log)

**Correto:**
```tsx
function Button({ onClick }: Props) {
  return (
    <button onClick={onClick} className="bg-blue-500 px-4 py-2 rounded">
      {/* ✅ Apenas classes CSS alteradas */}
      Click me
    </button>
  );
}
```

---

### 6. Diff Validation

#### 6.1 Checklist de Diff
- [ ] Diff mostra APENAS alterações em:
  - [ ] className/class
  - [ ] style (inline)
  - [ ] Ordem de elementos JSX
  - [ ] Wrappers visuais (divs, sections)
  - [ ] Atributos aria-*
- [ ] Diff NÃO mostra alterações em:
  - [ ] import statements (exceto CSS)
  - [ ] Tipos/interfaces
  - [ ] Props destructuring
  - [ ] Hooks (useState, useEffect, etc)
  - [ ] Funções JavaScript
  - [ ] API calls
  - [ ] Event handlers logic

#### 6.2 Exemplo de Diff Válido

```diff
  export function UserCard({ user }: Props) {
    return (
-     <div className="p-4">
+     <div className="p-6 bg-white rounded-lg shadow-md">
-       <h2 className="text-lg">{user.name}</h2>
+       <h2 className="text-xl font-bold text-gray-900">{user.name}</h2>
-       <p>{user.email}</p>
+       <p className="text-gray-600 mt-2">{user.email}</p>
      </div>
    );
  }
```

**Validação:** ✅ Apenas classes CSS alteradas

---

#### 6.3 Exemplo de Diff Inválido

```diff
  export function UserCard({ user }: Props) {
+   const [expanded, setExpanded] = useState(false); // ❌ Hook adicionado
    
    return (
      <div className="p-6">
        <h2>{user.name}</h2>
+       <button onClick={() => setExpanded(!expanded)}> {/* ❌ Lógica adicionada */}
+         {expanded ? 'Collapse' : 'Expand'}
+       </button>
      </div>
    );
  }
```

**Problemas:**
- ❌ useState adicionado
- ❌ Lógica de toggle adicionada
- ❌ Mudou comportamento funcional

---

### 7. Quando Escalar

#### 7.1 Situações que Requerem Escalação
- [ ] Precisa adicionar/remover props?
- [ ] Precisa adicionar hooks?
- [ ] Precisa alterar event handlers?
- [ ] Precisa fazer API calls?
- [ ] Precisa alterar tipos/interfaces?
- [ ] Precisa mudar lógica de negócio?

**Ação:** PAUSAR e chamar agente apropriado (Codex Dev ou Architect)

---

### 8. CI/CD Validation

#### 8.1 GitHub Actions

```yaml
name: Validate UI-Only Changes

on: [pull_request]

jobs:
  check-ui-changes:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      
      - name: Check for logic changes
        run: |
          # Verificar se há mudanças em hooks
          if git diff origin/main...HEAD | grep -E '\buseState|\buseEffect|\buseCallback'; then
            echo "::warning::Hooks changed - verify this is not UI-only PR"
          fi
          
          # Verificar se há mudanças em interfaces
          if git diff origin/main...HEAD | grep -E '\binterface |\btype '; then
            echo "::warning::Types changed - verify this is not UI-only PR"
          fi
```

---

### 9. Score de Compliance

#### Cálculo do Score

**Pontuação:**
- Apenas alterações visuais (40 pontos)
- Props inalteradas (25 pontos)
- Tipos inalterados (15 pontos)
- Hooks inalterados (10 pontos)
- Testes não quebram (10 pontos)

**Total:** 100 pontos

#### Checklist Rápido

| Item | Pontos | ✅ |
|------|--------|---|
| Apenas HTML/CSS alterado | 40 | ☐ |
| Props inalteradas | 25 | ☐ |
| Tipos/interfaces inalterados | 15 | ☐ |
| Hooks inalterados | 10 | ☐ |
| Testes passam | 10 | ☐ |
| **TOTAL** | **100** | |

### Níveis
- 🏆 **Excellent:** 95-100 pontos
- ✅ **Good:** 85-94 pontos
- ⚠️ **Acceptable:** 75-84 pontos
- ❌ **Insufficient:** < 75 pontos

---

## 📚 Referências

- [[03-RULES-GLOBAL#R17]]
- [[04-Protocolo-Tasks]]
- [[09-Checklist-R14-IA-Nao-Reescreve]] (complementar)
