FROM debian:10

RUN apt-get update && apt-get install mariadb-server -y

ENV MYSQL_ROOT_PASSWORD=root
ARG db_name
ARG db_user
ARG db_pass 
COPY ./tools/init.sh .

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# RUN mkdir -d /run/mysql 

RUN chmod +x init.sh
RUN ./init.sh
CMD ["mysqld"]
# CMD ["tail", "-f"]
# RUN sh /tools.d/init.sh
# ENTRYPOINT ["bash", "/tools.d/init.sh"]

# CMD ["mysqld"]