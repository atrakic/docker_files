
# 1. docker run -d -p 9118:9118 lovoo/jenkins_exporter:latest --user $USER --password $PASS -j http://localhost:8080 -p 9118
# 2. docker volume create --name $DOCKER-alert-data

. ../env.sh
docker run --name=$DOCKER -d --restart=always -p 9090:9090 -v /var/run/docker.sock:/var/run/docker.sock $DOCKER:$TAG
