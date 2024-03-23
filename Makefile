init:
	terraform init

lint:
	terraform validate
	terraform fmt -recursive
