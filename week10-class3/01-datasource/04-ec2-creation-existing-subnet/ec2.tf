data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.prod-vpc.id]
  }

  tags = {
    Tier = "Private"
  }
}

resource "aws_instance" "app" {
  for_each      = toset(data.aws_subnets.private.ids)
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = each.value
}