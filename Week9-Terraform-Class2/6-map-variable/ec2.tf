provider "aws" {
  region = var.region
}

variable "region" {
}


variable "ec2_ami" {
  type = map(string)
  default = {
    "us-east-1" = "ami-0a313d6098716f372"
    "us-east-2" = "ami-0beaa649c482330f7"
  }
}

resource "aws_instance" "example" {
  ami           = lookup(var.ec2_ami, var.region)
  instance_type = "t2.micro"
}

