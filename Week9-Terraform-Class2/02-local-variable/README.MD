# Local Variable

# Local Variable

- **local variable**

> Local variables are blocks of code within Terraform that allow us to store static pieces of data that we might want to refer to at a later date, or deeply dynamic pieces of data that can be manipulated by the state of our resources, data sources, and information provided by our input variables or even other local 

- **What is better local or global variable?**

> The main difference between Global and local variables is that global variables can be accessed globally in the entire program, whereas local variables can be accessed only within the function or block in which they are defined.

locals {
  bucket_name = "mytest"
  env         = "dev"
}


resource "aws_s3_bucket" "my_test_bucket" {
  bucket = local.bucket_name
  acl    = "public-read-write"
 
  tags = {
    Name        = local.bucket_name
    Environment = local.env
  }
}




> Local variables are blocks of code within Terraform that allow us to store static pieces of data that we might want to refer to at a later date, or deeply dynamic pieces of data that can be manipulated by the state of our resources, data sources, and information provided by our input variables or even other local.

- https://spacelift.io/blog/terraform-locals

> What is a benefit of using a local variable over a global variable?
Advantages of using local variables: We do not have to take care of deleting unnecessary variables when the task is complete because local variables are deleted from memory automatically when their task is complete. When you use local variables, you do not have to worry that they will be changed by another task.

- https://developer.hashicorp.com/terraform/language/values/locals

