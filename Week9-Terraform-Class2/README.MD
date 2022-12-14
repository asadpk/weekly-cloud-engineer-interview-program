# Terraform Variable

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



- Input variables

> Input variables are usually defined by stating a name, type and a default value. However, the type and default values are not strictly necessary. Terraform can deduct the type of the variable from the default or input value.

> Variables can be predetermined in a file or included in the command-line options. As such, the simplest variable is just a name while the type and value are selected based on the input.

```
main.tf 

variable "bucket_prefix" {
  type    = string
  default = "cnl123bucketterraform"
}

locals {
  bucket_name = "${var.bucket_prefix}-bucket1"
}

resource "aws_s3_bucket" "my_test_bucket" {
  bucket = local.bucket_name
  acl    = "public-read-write"
}
```

```
terraform apply -var bucket_prefix="cnlvijaytesrrform12345"
```



# Boolean Variable

To represent true or false values, we can use the Boolean type—for example, one variable to enable or not a verbose mode for some process.

variable "enable_debug" {
  default = false
}

We didn’t specify the variable type in the example above, and it works perfectly. Also, we can override the "enable_debug" value at any moment.

```
terarform apply -var enable_debug="true"
```

The Terraform Variable Type Boolean supports another approach to specify “true” or “false.”

We can specify zero “0” with double quotes, and the Terraform will automatically convert it to false. The same idea happens for “true,” we can specify “1,” and it will be converted to “true.”


- go to 4-boolean-variable folder

> first default = true and execute it
> go to aws console and see ec2 has been created with public IP or not ?



