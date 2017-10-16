
# docker run -d -p 9118:9118 lovoo/jenkins_exporter:latest --user admin --password 1234 -j http://jenkins:8080 -p 9118

# docker volume create --name $DOCKER-alert-data

DOCKER=$(basename "$PWD")

docker run --name=$DOCKER -d -p 9090:9090 $DOCKER:local

# docker run -d --name prometheus -p 9090:9090 -v $(pwd)/config:/prometheus-config prom/prometheus -config.file=/prometheus-config/prometheus.yml 

#docker run -d --name prometheus-alert \
#       -p 9093:9093 \
#        -v prometheus-alert-data:/alertmanager \
#         -v $(pwd)/alertmanager.yml:/etc/alertmanager/alertmanager.yml \
#          prom/alertmanager \
#          -config.file=/etc/alertmanager/alertmanager.yml
