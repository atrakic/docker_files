
docker run -d -v /var/lib/grafana --name grafana-storage grafana:local
docker run -d \
   -p 3000:3000 \
  --name=grafana \
  --volumes-from grafana-storage \
   grafana:local
