all: fmt validate plan

fmt:
	terraform fmt . 

validate: 
	terraform validate -check-variables=false .  

plan:
	terraform plan  

tflint: 
	tflint
