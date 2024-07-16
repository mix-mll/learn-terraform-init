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

apply:
	terraform apply "tfplan"

plan_to_json:
	terraform show -json "tfplan" | jq > tfplan.json

query_json_plan:
# simple nodes
	jq '.terraform_version, .format_version' tfplan.json

# nested
	jq '.prior_state.format_version' tfplan.json
	jq '.configuration.provider_config.aws.full_name' tfplan.json

# array	
	jq '.relevant_attributes' tfplan.json
	jq '.relevant_attributes .[] | .resource' tfplan.json


destoy_plan:
	terraform plan -destroy -out "tfplan-destroy"

destroy_apply:
	terraform apply "tfplan-destroy"

destroy:
	terraform destroy --auto-approve
