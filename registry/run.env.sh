. ../env.sh 
docker run --name $DOCKER -d -p 5000:5000 --restart=always $DOCKER:$TAG

