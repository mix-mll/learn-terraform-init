hello:
	echo "hello"

init:
	terraform init -upgrade

lint:
	terraform validate
	terraform fmt -recursive

plan:
	terraform plan

state:
	terraform show
	terraform state list
