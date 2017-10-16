all: fmt validate init plan

init: 
	terraform init 

fmt:
	terraform fmt . 

validate: 
	terraform validate -check-variables=false .  

plan:
	terraform plan  

tflint: 
	tflint
