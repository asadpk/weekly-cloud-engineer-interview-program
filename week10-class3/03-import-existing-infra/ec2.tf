resource "aws_instance" "myvm1" {
  ami           = "XXXX"
  instance_type = "t2.micro"
}

resource "aws_instance" "myvm2" {
  ami           = "XXXXX"
  instance_type = "t2.micro"
}
