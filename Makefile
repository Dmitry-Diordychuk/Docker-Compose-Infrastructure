# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kdustin <kdustin@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/06 15:42:13 by kdustin           #+#    #+#              #
#    Updated: 2021/10/08 19:11:51 by kdustin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := Inception

all: $(NAME)

$(NAME):
	grep -xF '127.0.0.1 kdustin.42.fr' /etc/hosts || (echo '127.0.0.1 kdustin.42.fr' | sudo tee -a /etc/hosts)
	userdel mysql || true
	useradd -u 999 mysql
	mkdir -p /home/kdustin/data/mysql
	chown -R mysql:mysql /home/kdustin/data/mysql

	userdel www-data || true
	useradd -u 82 www-data
	mkdir -p /home/kdustin/data/html
	chown -R www-data:www-data /home/kdustin/data/html

	docker build --tag kdustin/mariadb ./srcs/requirements/mariadb/
	docker build --tag kdustin/wordpress ./srcs/requirements/wordpress/
	docker build --tag kdustin/nginx ./srcs/requirements/nginx/

	openssl req \
		-x509 \
		-nodes \
		-days 365 \
		-subj "/C=RU/ST=Moscow/O=42School, Inc./OU=IT/CN=kdustin.42.fr" \
		-addext "subjectAltName=DNS:kdustin.42.fr" \
		-newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt;

	cp /etc/ssl/private/nginx-selfsigned.key /srcs/requirements/nginx/conf/nginx-selfsigned.key
	cp /etc/ssl/certs/nginx-selfsigned.crt /srcs/requirements/nginx/conf/nginx-selfsigned.crt

	cd srcs ; docker-compose up -d

clear:
	cd srcs ; docker-compose down
	docker rmi kdustin/mariadb
	docker rmi kdustin/wordpress
	docker rmi kdustin/nginx

fclear: clear
	userdel mysql || true
	userdel www-data || true
	rm -rf /home/kdustin/data
	grep -vq "127.0.0.1 kdustin.42.fr" /etc/hosts | sudo tee -a /etc/hosts

re: fclear all

.PHONY: $(NAME) clear fclear re
