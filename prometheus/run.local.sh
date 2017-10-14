DOCKER=prometheus
docker run --name=$DOCKER -d -p 9090:9090 $DOCKER:local
