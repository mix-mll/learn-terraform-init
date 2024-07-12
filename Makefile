hello:
	echo "hello"

init:
	terraform init -upgrade

lint:
	terraform validate
	terraform fmt -recursive
