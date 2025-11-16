# Observabilidade 📈

## Logs
- Estruturados (pino/winston) com correlação (`traceId`).
- Coleta: Grafana Loki ou OpenSearch.

## Métricas
- OpenTelemetry SDK → Prometheus.
- Dashboards: Grafana (latência, throughput, erros, filas).

## Tracing
- OTel SDK (HTTP/gRPC) → Tempo/Jaeger.
- Propagação de contexto entre módulos.

## Health/Status
- Endpoints `/health` por módulo (readiness/liveness).
- Checks: banco, cache, filas, externos.

## Erros
- Sentry/compatível (GlitchTip) com releases e breadcrumbs.

## Checklists
- Correlação em logs, amostragem de traces, alertas por SLO.
- Registrar dashboards e playbooks de incidentes.