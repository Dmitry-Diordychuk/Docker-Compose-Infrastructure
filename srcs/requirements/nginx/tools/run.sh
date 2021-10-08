adduser -D -g 'nginx' nginx
chown -R nginx:nginx /var/www/html

mv /var/src/nginx.conf /etc/nginx/nginx.conf

openssl req \
		-x509 \
		-nodes \
		-days 365 \
		-subj "/C=RU/ST=Moscow/O=42School, Inc./OU=IT/CN=kdustin.42.fr" \
		-addext "subjectAltName=DNS:kdustin.42.fr" \
		-newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt;

nginx -g "daemon off;"
