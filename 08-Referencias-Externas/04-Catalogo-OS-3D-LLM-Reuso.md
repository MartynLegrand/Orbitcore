# Catálogo OS (3D + Agents + UI) e Plano de Reuso Ético

## 1. Política No‑Rewrite‑First
- Gate de licença; encapsular; adapters por linguagem; observabilidade; contrato claro; LLM‑Control.

## 2. Pipeline de Conversão
- Discovery & Score → Licensing Gate (SBOM) → Isolamento/Execução → Adapter SDK → Dados/Formatos → Auth/RBAC → Telemetria & Logs → Test Harness → LLM Tools → Documentação.

## 3. Catálogo
- DCC/Engines/Render: Blender, Godot, Three.js, Babylon.js, Filament, LuxCore, Embree, OSPRay.
- Pipelines/Formato: Open3D, Assimp, MeshLab, glTF‑Transform, Draco, FBX2glTF, OpenUSD, OpenVDB, OpenImageIO, OpenColorIO, OpenTimelineIO.
- Personagem/MoCap: MakeHuman, MB‑Lab, OpenPose, MediaPipe Pose.
- Fotogrametria: Meshroom, OpenMVG, OpenMVS.
- XR/VR: OpenXR/Monado/OpenVR/CesiumJS.
- STT/TTS: Whisper, faster‑whisper, Riva, Coqui‑TTS.
- LLMs/Agentes: Ollama, llama.cpp, Rasa, LangChain, Flowise, LibreChat.
- Templates Next: Vercel Templates, Next.js Commerce, shadcn/ui, refine.
- Observabilidade/Notificações: OTel, Loki, OpenSearch, GlitchTip, ntfy, Apprise.

## 4. Controle por LLMs e Modo Local
- Local‑first com Ollama/llama.cpp; tools JSON Schema; STT/TTS híbrido; vetores com pgvector/Qdrant.

## 5. Biblioteca Visual
- Script para baixar imagens de READMEs; organizar em `assets/modules/`.

## 6. Checklists de Integração
- Licença; Docker; wrapper API; formato; auth; observabilidade; LLM tools; docs; testes.

## 7. Boilertemplates
- Client Node/TS (ky); Wrapper FastAPI.

## 8. Compliance
- MIT/Apache permissivas; GPL/AGPL com isolamento; SBOM/ATRIBUTION/NOTICE.

## 9. Referências
- Listas e projetos conforme categorias.