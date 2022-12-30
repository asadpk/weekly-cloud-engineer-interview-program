resource "aws_s3_bucket" "my_test_bucket1" {
  bucket = "cnlbackendbucket2022"
  acl    = "public-read-write"

}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.my_test_bucket1.id
  versioning_configuration {
    status = "Enabled"
  }
}
