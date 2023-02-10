resource "aws_instance" "my_vm" {
  ami           = "ami-00874d747dde814fa" //Ubuntu AMI
  instance_type = "t2.micro"

  tags = {
    Name = "My EC2 instance",
  }
}
