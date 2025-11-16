# Publicação de SDKs 📦

## npm (TypeScript)
- Package scope `@obm/<modulo>-sdk`.
- Semver, changelog e tags.
- Scripts: build, types, test.
- README com exemplos de uso.

## PyPI (Python)
- Nome `obm_<modulo>_sdk`.
- `pyproject.toml` (poetry/setuptools).
- Versionamento semântico e changelog.

## Boas Práticas
- Compatível com [[00-Config/05-Protocolo-Orbit-OBM]].
- Testes de contrato e integração.
- CI com publish automatizado mediante tag/release.