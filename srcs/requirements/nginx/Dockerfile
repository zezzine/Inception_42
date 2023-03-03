FROM debian:10

#Openssl open-source software library that provides cryptographic functions for secure communication over networks.

#Openssl command generates a self-signed X.509 certificate and private key for a web server using RSA ENCRYPTION .

#req this specifies that the openssl command should be used for creating a new certificate request and self-signed certificate.

#-509 this option specifies that the output should be an X.509 certificate instead of a certificate request.

#-newkey rsa:4096 - This option creates a new RSA key with a length of 4096 bits.

#-keyout key.pem - This option specifies the filename to write the private key to.
# In this case, it writes it to a file called key.pem.

#-out cert.pem - This option specifies the filename to write the certificate to.
# In this case, it writes it to a file called cert.pem.

#-days 365 - This option sets the validity period of the certificate to 365 days.

#-nodes - This option specifies that the private key should be saved without encryption.
# This is not recommended for production use but can be useful for development or testing purposes.

#-subj "/CN=localhost" - This option specifies the subject of the certificate.
# In this case, the subject is set to "localhost" for use in development or testing environments.

RUN apt-get update && apt-get install -y nginx openssl \
    && openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes -subj "/CN=localhost"

RUN mkdir ssl && mv ssl /etc/nginx

RUN mv key.pem /etc/nginx/ssl && mv cert.pem /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/sites-available/default

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]