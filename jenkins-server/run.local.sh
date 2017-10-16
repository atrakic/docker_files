DOCKER=$(basename "$PWD")
docker run --name $DOCKER -d --restart=always -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /data/jenkins/data:/var/jenkins_home  $DOCKER:local
