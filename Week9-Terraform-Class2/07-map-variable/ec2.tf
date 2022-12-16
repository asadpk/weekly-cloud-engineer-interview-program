variable "region" {}
variable "amis" {
  type = map(string)
  default = {
    "us-east-1" = "ami-0b0dcb5067f052a63"
    "us-east-2" = "ami-0185a6f76b69a1870"
  }
}

resource "aws_instance" "example" {
  ami           = lookup(var.amis, var.region)
  instance_type = "t2.micro"
}
