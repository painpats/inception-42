NAME =					inception
PATH_DOCKERCOMPOSE =	./srcs/docker-compose.yml
PATH_DATA =				/home/cbourre/data


all:	build

build:
	@sudo mkdir -p ${PATH_DATA}/wordpress
	@sudo mkdir -p ${PATH_DATA}/mariadb
	@docker compose -f ${PATH_DOCKERCOMPOSE} up -d --build
	docker ps

clean: down stop clean-volumes
	@docker volume rm -f `docker volume ls`

down:
	@docker compose -f ${PATH_DOCKERCOMPOSE} down -v

stop:
	@docker compose -f ${PATH_DOCKERCOMPOSE} stop

clean-volumes:
	@sudo rm -rf ${PATH_DATA}/wordpress
	@sudo rm -rf ${PATH_DATA}/mariadb

build-images:
	@docker compose -f ${PATH_DOCKERCOMPOSE} build
	docker image ls

prune:
	docker container prune -f
	docker image prune -f 
	docker volume prune -f
	docker network prune -f 
	docker system prune -f

re: clean clean-volumes all

.PHONY: all clean re build stop down clean-volumes prune