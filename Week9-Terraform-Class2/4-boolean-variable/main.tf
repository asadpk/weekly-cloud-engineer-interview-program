provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2_example" {
  ami                         = "ami-0b0dcb5067f052a63"
  instance_type               = "t2.micro"
  associate_public_ip_address = var.enable_public_ip
  tags = {
    Name = "Terraform EC2"
  }
}
