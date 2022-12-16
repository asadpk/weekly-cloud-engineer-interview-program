resource "aws_instance" "ec2_example" {

  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  count         = 1

  tags = {
    Name = "Terraform EC2"
  }

}
