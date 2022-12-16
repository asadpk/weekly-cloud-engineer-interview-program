# override input values during apply

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