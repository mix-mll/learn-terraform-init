# tutorial commands

# plan out file
terraform plan -out "add-object"


# get bucket id
echo $(terraform output -raw bucket_name)


# delete the bucket 
aws s3 rb s3://$(terraform output -raw bucket_name)



# show bucket state
terraform show -json | jq '.values.root_module.resources[] | select( .address == "aws_s3_bucket.example")'


# save plan as json
terraform show -json "add-object" | jq > add-object.json

# apply with plan
terraform apply "add-object"


# Use the -replace argument when a resource has become unhealthy
# or stops working in ways that are outside of Terraform's control
terraform apply -replace "aws_instance.main[1]"
