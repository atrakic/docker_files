
. ../env.sh 

docker run -d -v /var/lib/$DOCKER --name $DOCKER-storage $DOCKER:$TAG
docker run --name=$DOCKER -d -p 3000:3000 --name=$DOCKER --volumes-from $DOCKER-storage -v /var/run/docker.sock:/var/run/docker.sock $DOCKER:$TAG
