DOCKER=$(basename "$PWD")
docker build --rm --force-rm -t $DOCKER:local . 
