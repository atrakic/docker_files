
R_HOST=localhost
R_PORT=6000

IMAGE_ID=$1
VERSION=$2

#VERSION=$(git rev-parse --short HEAD)
#DOCKER=$(basename "$PWD")

# echo "login" && docker login $R_HOST:$R_PORT 

echo "tagging"  
#docker tag $IMAGE_ID $R_HOST:$R_PORT/$DOCKER:$VERSION
#docker tag  $DOCKER:latest $R_HOST:$R_PORT/$DOCKER:$VERSION
docker tag  $DOCKER:$VERSION $R_HOST:$R_PORT/$DOCKER:$VERSION

echo "pushing" 
docker push $R_HOST:$R_PORT/$DOCKER:$VERSION 
#docker push $R_HOST:$R_PORT/$DOCKER:newest 
