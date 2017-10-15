
IMAGE_ID=$1
VERSION=$2

DOCKER=$(basename "$PWD")
R_HOST=localhost
R_PORT=6000

# docker login $R_HOST:$R_PORT 
docker tag $IMAGE_ID $R_HOST:$R_PORT/$DOCKER:$VERSION
docker push $R_HOST:$R_PORT/$DOCKER:$VERSION 
