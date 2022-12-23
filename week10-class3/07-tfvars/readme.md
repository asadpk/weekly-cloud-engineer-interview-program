#TFVARS

[![Watch the video](tfvars.png)]




# Step 1

- simple variable create VPC,Public Subnet,Private Subnet.

terraform init
terraform validate
terraform plan
terraform apply

# step 2

Now go to 02-tfvars directory

now terraform plan -var="pubsubcidr=10.0.10.0/24"

terraform apply -var="pubsubcidr=10.0.10.0/24"

terraform apply -var="pubsubcidr=10.0.20.0/24"

# step 3

## Manually giving one variable file as an input which contains all values

terraform init
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
terraform destroy -var-file="dev.tfvars"


# step 4
## Even if we dont give any variable file as an input it wont take any values from varaiable files and it wont take it from .tfvars file.

## it will check <anyname>.auto.tfvars

## if terraform see any *.auto.tfvars that file only will take as an first input.


terraform init
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
terraform destroy -var-file="dev.tfvars"