locals {
  bucket_name1 = "mytest-cnl-12345"
  bucket_name2 = "mytest-cnl-123452023"
  env         = "dev1"
}


resource "aws_s3_bucket" "my_test_bucket1" {
  bucket = local.bucket_name1
  acl    = "public-read-write"

  tags = {
    Name        = local.bucket_name1
    Environment = local.env
  }
}

resource "aws_s3_bucket" "my_test_bucket2" {
  bucket = local.bucket_name2
  acl    = "public-read-write"

  tags = {
    Name        = local.bucket_name2
    Mail = "vijay@cloudnloud.com"
    Environment = local.env
  }
}