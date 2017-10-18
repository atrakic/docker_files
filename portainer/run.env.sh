. ../env.sh
docker run --name=$DOCKER -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/data/portainer/data:/data $DOCKER:$TAG 
