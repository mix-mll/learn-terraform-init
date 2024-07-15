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

aws_var:
	echo ${AWS_ACCESS_KEY_ID}
	echo ${AWS_SECRET_ACCESS_KEY}

tf_plan:
	terraform plan -out "tfplan"

show:
	terraform show "tfplan"
