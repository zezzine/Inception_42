# Use the official Debian image as the base image
FROM debian:10

WORKDIR /var/www/html/

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    php7.3 \
    php7.3-fpm \
    unzip \
    php7.3-mysql \
    php7.3-phar \
    wget mariadb-server \
    redis-server php-dev

# Download and extract the latest version of WordPress

RUN pecl install redis

COPY ./conf/redis.conf /etc/redis/redis.conf
COPY ./conf/wp-config.php /
COPY ./conf/www.conf /
COPY ./tools/init.sh /init.sh

RUN chmod +x /init.sh
ENTRYPOINT ["bash", "/init.sh"]
RUN service php7.3-fpm start
CMD ["/usr/sbin/php-fpm7.3", "-F", "-R"] 