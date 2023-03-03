FROM debian:10

RUN apt-get update && apt-get -y install mariadb-server

#set the value of the variable mysql_root_password is root

ENV MYSQL_ROOT_PASSWORD=root
ARG db_name
ARG db_user
ARG db_pass
COPY ./tools/init.sh .

#In summary, a socket is a software endpoint that enables communication between two processes over a computer network.
#It provides an abstraction for a bidirectional communications channel, consisting of an IP address,
#a transport protocol, and a port number.
#Sockets are used in many network-based applications to allow processes on different machines to send and receive data to each other.

#In summary, a bind address is the IP address of a network interface 
#on a computer that is used to bind a socket to a specific network port.
#This allows the computer to listen for incoming network connections on that port and handle network traffic that is sent to that port.

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x init.sh

RUN ./init.sh

#mysqld daemon process that runs the MySQL server.

CMD ["mysqld"]