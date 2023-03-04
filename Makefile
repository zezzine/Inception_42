DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
DOCKER_COMPOSE = docker-compose
up:
	@printf "\033[32m\033[1mdocker loading ...\033[0m\033[0m\n"
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

down:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

clean:
	@printf "\033[34m\033[1mdocker stopped and volumes removed ...\033[0m\033[0m\n"
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down --remove-orphans
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down -v

re : clean up