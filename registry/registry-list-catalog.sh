. ../env.sh

curl -s  --cacert certs/ca.crt -u $REGISTRY_USER:$REGISTRY_PASS  -X GET https://localhost:5000/v2/_catalog # | jq '.'
