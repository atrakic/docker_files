
. ../env.sh

IMAGE_ID="$1"
VERSION="$2"

echo "pushing"
docker push "$REGISTRY_HOST":"$REGISTRY_PORT"/"$DOCKER":"$VERSION"
