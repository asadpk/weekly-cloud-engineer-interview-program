provider "aws" {
  region = "us-east-1"
}

locals {
  instance_name = terraform.workspace
}

resource "aws_instance" "ec2_example" {
  ami           = "ami-00874d747dde814fa"
  instance_type = var.instance_type
  tags = {
    Name = local.instance_name
  }
}
