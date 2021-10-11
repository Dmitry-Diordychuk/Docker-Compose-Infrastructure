FROM alpine:3.14

ENV WORDPRESS_DB_HOST 1
ENV MYSQL_ROOT_PASSWORD 2
ENV WORDPRESS_DB_NAME 3
ENV WORDPRESS_DB_USER 4
ENV WORDPRESS_DB_PASSWORD 5
ENV WORDPRESS_TABLE_PREFIX 6

RUN apk update && apk --no-cache add php8 php8-fpm php8-mysqli curl

WORKDIR /usr/src

COPY ./conf/wp-config.php /usr/src
COPY ./tools/run.sh /usr/src

EXPOSE 9000 3306

ENTRYPOINT ["/bin/sh", "run.sh"]
