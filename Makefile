# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kdustin <kdustin@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/06 15:42:13 by kdustin           #+#    #+#              #
#    Updated: 2021/10/11 17:25:52 by kdustin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

before:
	docker stop `docker ps -qa` || true
	docker rm `docker ps -qa` || true
	docker rmi -f `docker images -qa` || true
	docker volume rm `docker volume ls -q` || true
	docker network rm `docker network ls -q` 2>/dev/null

all: up

build:
	mkdir -p /home/kdustin/data/wordpress
	mkdir -p /home/kdustin/data/mariadb
	grep -xF '127.0.0.1 kdustin.42.fr' /etc/hosts || (echo '127.0.0.1 kdustin.42.fr' | sudo tee -a /etc/hosts)
	docker build --tag kdustin/mariadb ./srcs/requirements/mariadb/
	docker build --tag kdustin/wordpress ./srcs/requirements/wordpress/
	docker build --tag kdustin/nginx ./srcs/requirements/nginx/

destroy:
	docker rmi kdustin/mariadb || true
	docker rmi kdustin/wordpress || true
	docker rmi kdustin/nginx || true
	docker volume rm srcs_mariadb || true
	docker volume rm srcs_wordpress || true
	rm -rf /home/kdustin/data || true
	grep -vq "127.0.0.1 kdustin.42.fr" /etc/hosts | sudo tee -a /etc/hosts

up:
	cd srcs ; docker-compose up -d

down:
	cd srcs ; docker-compose down

.PHONY: $(NAME) clear fclear re
