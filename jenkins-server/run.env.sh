. ../env.sh

docker run --name $DOCKER \
  -d --restart=always \
  -p 8080:8080 \
  -p 50000:50000 \
  --env JAVA_OPTS=-Djenkins.install.runSetupWizard=false \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  -v "jenkins_home:/var/jenkins_home" $DOCKER:$TAG
