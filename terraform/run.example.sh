#! /usr/bin/env bash 

#echo "$@" 
# if [[ $# -lt 2 ]];then echo "need more args"; exit 1;fi 
#TERRAFORM_AWS_ADDRESS_KEY=$1
#TERRAFORM_AWS_SECRET_KEY=$2
#TERRAFORM_AWS_REGION=$3
#echo "$TERRAFORM_AWS_ACCESS_KEY $TERRAFORM_AWS_SECRET_KEY $TERRAFORM_AWS_REGION" 

docker run -t --rm terraform:local plan \
  -var "access_key=$TERRAFORM_AWS_ACCESS_KEY" \
  -var "secret_key=$TERRAFORM_AWS_SECRET_KEY" -var "region=$TERRAFORM_AWS_REGION" 

