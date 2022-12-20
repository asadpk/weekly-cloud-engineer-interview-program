resource "aws_vpc" "prod-vpc" {
  cidr_block       = var.vpc-cidr
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_subnets" {
 count      = length(var.public_subnet)
 vpc_id     = aws_vpc.prod-vpc.id
 cidr_block = element(var.public_subnet, count.index)
}

resource "aws_subnet" "private_subnets" {
 count      = length(var.private_subnet)
 vpc_id     = aws_vpc.prod-vpc.id
 cidr_block = element(var.private_subnet, count.index)
 tags = {
    Tier = "Private"
  }
}