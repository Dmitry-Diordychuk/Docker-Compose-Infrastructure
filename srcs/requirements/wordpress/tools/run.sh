# listen = 9000 to listen on all interfaces (use the IPv4 catch-all address instead of the local loopback)
# remove listen.allowed_clients to allow connection from outside the container
sed -e 's/127.0.0.1:9000/9000/' \
	-e '/allowed_clients/d' \
	-i /etc/php8/php-fpm.d/www.conf

curl -o wordpress.tar.gz "https://wordpress.org/wordpress-5.8.1.tar.gz"
mkdir /usr/src/
tar -xzf wordpress.tar.gz -C /usr/src/
(delgroup www-data || true) && adduser -D www-data
chown -R www-data:www-data /usr/src/wordpress
mkdir -p /var/www
cp -a /usr/src/wordpress/. /var/www/html
chown -R www-data:www-data /var/www;
cp /usr/src/wp-config.php /var/www/html

php-fpm8 --nodaemonize
