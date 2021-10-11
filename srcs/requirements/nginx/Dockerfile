FROM alpine:3.14

RUN apk update && apk add nginx openssl

WORKDIR /var/src

COPY ./conf/nginx.conf /var/src/
COPY ./tools/run.sh /var/src/

EXPOSE 80

STOPSIGNAL SIGQUIT

ENTRYPOINT [ "/bin/sh", "run.sh" ]
