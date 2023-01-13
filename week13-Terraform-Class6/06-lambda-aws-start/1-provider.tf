provider "aws" {
  region     = var.region
  access_key = var.accessKey
  secret_key = var.secretKey
}

terraform {
  required_version = ">= 0.12"
}
