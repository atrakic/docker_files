. ../env.sh

state=$(docker inspect --format "{{.State.Running}}" "$DOCKER" 2>/dev/null)

if [[ "$state" == "true" ]] && [[ "$*" != "" ]]; then
     ./gen-security-data.sh
     docker run --name $DOCKER -d -p 5000:5000 --restart=always $DOCKER:$TAG
     return 0
fi

