un e auto menssagem dCOMPOSE=infra/compose.obm.integrated.yml
ENV=infra/.env

bootstrap:
	cp -n infra/.env.example $(ENV) || true
	docker compose -f $(COMPOSE) up -d
	./scripts/bootstrap.sh

test:
	./scripts/test.sh

down:
	docker compose -f $(COMPOSE) down