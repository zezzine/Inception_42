curl -O https://wordpress.org/latest.zip 
unzip latest.zip 
rm -rf latest.zip

cd /var/www/html/wordpress
rm wp-config-sample.php
mv /wp-config.php /var/www/html/wordpress

cp -R * ../
cd ..
rm -rf wordpress

#make www.conf listen to 9000
mv /www.conf /etc/php/7.3/fpm/pool.d/www.conf

#installing wp-cli

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
wp core config --allow-root --dbhost=mariadb --dbname=$db_name --dbuser=$db_user --dbpass=$db_pass
wp core install --url=$DOMAIN_NAME/ --title=$TITLE --admin_user=$ADMIN_U --admin_password=$ADMIN_P --admin_email=$ADMIN_MAIL --skip-email --allow-root
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$PASSWORD_USR --allow-root

chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
chown -R www-data:www-data /var/www/html/wp-content/
chmod -R 775 /var/www/html/wp-content/


#redis fields
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root
wp plugin update --all --allow-root

/usr/sbin/php-fpm7.3 -F -R