FROM alpine:3.14

ENV MYSQL_ROOT_PASSWORD 1
ENV MYSQL_DATABASE 2
ENV MYSQL_USER 3
ENV MYSQL_PASSWORD 4

RUN apk update && apk add mariadb mariadb-client

COPY ./tools/run.sh /
COPY ./conf/db.tar.bz2 /

EXPOSE 3306

ENTRYPOINT ["/bin/sh", "run.sh"]
