provider "aws" {
  region = "us-east-1"
}

terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket               = "cnlbackendbucket2022"
    workspace_key_prefix = "us-east-1/tutorial"
    key                  = "testserver"
    region               = "us-east-1"

    dynamodb_table = "terraform-up-and-running-locks"
  }
}


variable "name_tag" {
  type        = string
  description = "Name of the EC2 instance"
  default     = "EC2"
}

variable "ami" {
  default = "ami-00874d747dde814fa"
}

variable "instance_type" {
  default = "t2.micro"
}

resource "aws_instance" "my_vm" {
  ami           = var.ami //Ubuntu AMI
  instance_type = var.instance_type

  tags = {
    Name = "sap-server-${terraform.workspace}"
  }
}
