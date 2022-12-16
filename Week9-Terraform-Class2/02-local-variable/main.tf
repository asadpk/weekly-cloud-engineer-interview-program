locals {
  bucket_name = "mytest-cnl-12345"
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


