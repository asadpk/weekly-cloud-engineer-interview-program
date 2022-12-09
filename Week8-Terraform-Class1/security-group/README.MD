# What we are going do ?

- 1. we are going to create VPC
- 2. we are going to create public subnet
- 3. we are going to create EC2 instance
- 4. we are going to install apache webserver using user_data option in the newly created ec2 instance.
- we are going to create security group with ingress and exgress rule.what ports need to be allowed outside and inside.


# Interpolation

- variables 
- syntax

${..}

variables :

${var.variable_name}
Example : ${var.ami}

Resources :

${provider_resource-type.identifier.attribute}
Example: ${aws_instance.my_ec2.id}


- For example :

resource "aws_security_group" "webserver_sg" {

    ingress{ }

    egress { }
}

resource "aws_instance" "my-webserver" {
    ami = "ami-0a313d6098716f372"
 instance_type = "t2.micro"
 vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]
 tags = {
	 Name = "My-Webserver"
 }
 key_name = "terraform"
}



- note : https://checkip.amazonaws.com to find out your public ip while creating security group