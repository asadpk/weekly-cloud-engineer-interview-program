resource "aws_instance" "myvm" {
 ami           = "ami-0b5eea76982371e91"
 instance_type = "t2.micro"
}

resource "aws_instance" "myvm2" {
 ami           = "ami-0b5eea76982371e91"
 instance_type = "t2.micro"
}