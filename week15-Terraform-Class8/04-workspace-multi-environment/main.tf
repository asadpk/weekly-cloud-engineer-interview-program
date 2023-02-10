terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

variable "environment" {
  type    = string
  default = "dev"
}

resource "aws_iam_policy" "s3_policy" {
  name = "s3_policy_for_${var.environment}"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "s3:GetObject",
        "Resource" : "*"
    }]
  })
}
