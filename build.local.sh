DOCKER=$(basename "$PWD")
TAG=$(basename $0 | awk -F'.' '{ print  $2 }')
docker build --rm --force-rm -t $DOCKER:$TAG . 
