FROM debian:10

RUN apt -y update

COPY ./tools/init.sh /

RUN apt install wget -y && apt install php php-mysql  -y

WORKDIR /var/www

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    mv adminer-4.8.1.php index.php && chown -R root:root /var/www/

CMD ["php", "-S", "[::]:8888", "-t", "/var/www"]