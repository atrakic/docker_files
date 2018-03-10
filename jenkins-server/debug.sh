. ../env.sh
docker run -it --entrypoint=/usr/local/bin/jenkins.sh -p 8080:8080 $DOCKER:$TAG
