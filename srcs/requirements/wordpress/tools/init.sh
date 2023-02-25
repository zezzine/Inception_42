if [ ! -d "/run/php" ]; then
	mkdir -p /run/php
	chown -R www-data:www-data /run/php
fi

curl -O https://wordpress.org/latest.zip 
unzip latest.zip 
rm -rf latest.zip

cd /var/www/html/wordpress
rm wp-config-sample.php
mv /wp-config.php /var/www/html/wordpress

cp -R * ../
cd ..
rm -rf wordpress

mv /www.conf /etc/php/7.3/fpm/pool.d/www.conf

#installing wp-cli

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
wp core config --allow-root --dbhost=mariadb --dbname=$db_name --dbuser=$db_user --dbpass=$db_pass
wp core install --url=$DOMAIN_NAME/ --title=$TITLE --admin_user=$ADMIN_U --admin_password=$ADMIN_P --admin_email=$ADMIN_MAIL --skip-email --allow-root
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$PASSWORD_USR --allow-root

service redis-server start
cd /etc/redis/
sed -i 's/supervised no/supervised systemd/' /etc/redis/redis.conf

/usr/sbin/php-fpm7.3 -F -R