DOCKER=$(basename "$PWD")
TAG=$(git rev-parse --abbrev-ref HEAD) 

REGISTRY_USER=$TAG
REGISTRY_PASS=$TAG-12345
