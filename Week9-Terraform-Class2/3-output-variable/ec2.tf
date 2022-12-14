resource "aws_instance" "web_server" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = var.ec2_instance_type
}


