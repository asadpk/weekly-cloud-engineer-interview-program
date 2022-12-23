# backend state learning

[![Watch the video](backend-state.jpg)]
[![Watch the video](remote-state.png)]
[![Watch the video](remote-state1.png)]

# step 1

- first go to subfolder called 01-firstbucket-creation
- create cnlbackendbucket2022 bucket
- now cnlbackendbucket2022 bucket will be created and versioning will be enabled

- now come out of sub folder

# step 2

- go to subfolder called 02-dynamodb-creation
- Create dynamodb table

# step 3



- first create ec2.tf file and paste the below 

```
resource "aws_instance" "example" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
}
```

- then execute the below command

```
terraform apply
```

# step 4

- in the same 03-only-create-ec2-local-state-file folder now create one more file called backend.tf

```
terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket = "cnlbackendbucket2022"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

```

> now you run the below command

```
terraform apply

```

```
$ terraform init

Initializing the backend...
Acquiring state lock. This may take a few moments...
Do you want to copy existing state to the new backend?
  Pre-existing state was found while migrating the previous "local" 
  backend to the newly configured "s3" backend. No existing state 
  was found in the newly configured "s3" backend. Do you want to 
  copy this state to the new "s3" backend? Enter "yes" to copy and 
  "no" to start with an empty state.

  Enter a value:
```

> Terraform will automatically detect that you already have a state file locally and prompt you to copy it to the new S3 backend. If you type yes, you should see the following:

> Successfully configured the backend "s3"! Terraform will automatically use this backend unless the backend configuration changes.
- Next, create an S3 bucket by using the aws_s3_bucket resource:
- create file called backend.tf


```
terraform state list
```
```
terraform state pull
```

```
terraform destroy
```