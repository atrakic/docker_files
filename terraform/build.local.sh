DOCKER=$(basename "$PWD")
docker build -t $DOCKER:local . 
