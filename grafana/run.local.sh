
DOCKER=$(basename "$PWD")

# docker run -d -v /var/lib/$DOCKER --name $DOCKER-storage $DOCKER:local
docker run -d -p 3000:3000 --name=$DOCKER --volumes-from $DOCKER-storage -v /var/run/docker.sock:/var/run/docker.sock $DOCKER:local
