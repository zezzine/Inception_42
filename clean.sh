docker container rm -f $(docker container ls -aq)
docker image rm $(docker image ls -aq)
docker volume rm $(docker volume ls -q)