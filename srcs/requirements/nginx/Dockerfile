FROM debian:10

RUN apt-get update && apt-get install -y nginx openssl \
    && openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes -subj "/CN=localhost"

RUN mkdir ssl && mv ssl /etc/nginx

RUN mv key.pem /etc/nginx/ssl && mv cert.pem /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/sites-available/default

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]