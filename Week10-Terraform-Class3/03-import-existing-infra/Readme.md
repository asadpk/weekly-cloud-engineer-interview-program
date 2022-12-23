# Import existing Infrastructure

[![Watch the video](2.png)]
[![Watch the video](1.png)]

- create ec2 instance manually using AWS GUI
- create general provider.tf
- create ec2.tf with some empty values

```
resource "aws_instance" "myvm1" {
  ami           = "XXXX"
  instance_type = "t2.micro"
}

resource "aws_instance" "myvm2" {
  ami           = "XXXXX"
  instance_type = "t2.micro"
}
```

- go  to aws gui console and get the running ec2 instance id
- run below commands

```
terraform import aws_instance.myvm1 i-0164af1aab5ffd692
terraform import aws_instance.myvm2 i-0d218bb949d0ee05c
```
- run terraform state list command