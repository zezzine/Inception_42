# Choose the Image which has Node installed already
FROM debian:10

# Install necessary packages
RUN apt-get update && apt-get install -y curl gnupg

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# COPY all the files from Current Directory into the Container
COPY ./tools ./

# Install the Project Dependencies like Express Framework
RUN npm install express

# Tell that this image is going to Open a Port 
EXPOSE 2001

# Default Command to launch the Application
CMD ["npm", "start"]