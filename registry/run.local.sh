DOCKER=$(basename "$PWD")
docker run -d -p 5000:5000 --restart=always --name $DOCKER $DOCKER:local

