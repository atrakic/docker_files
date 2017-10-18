DOCKER=$(basename "$PWD")
docker run --name $DOCKER -p 8090:8080 -v /var/run/docker.sock:/var/run/docker.sock:ro $DOCKER:local
