FROM debian:10

RUN apt -y update

COPY ./tools/init.sh /

RUN apt install wget -y && apt install php php-mysql  -y

CMD ["chmod" ,"777" ,"init.sh", "./init.sh"]