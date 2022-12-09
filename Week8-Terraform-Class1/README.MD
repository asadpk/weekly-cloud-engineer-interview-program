# Terraform Administration

📌 What is Terraform
📌 Why Terraform
📌 What is mutable and Immutable

Hands-on

📌 How to set up a lab on your laptop
📌 How to first start an easy way of terraform automation.


# How to create Elastic IP

```

# provider block for aws cloud #
provider "aws" {
  region = "us-east-1"
}

# resource block for ec2  #
resource "aws_instance" "myec2" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"
  tags = {
    Description = "server1-cnl"
  }
}


resource "aws_eip" "lb" {
  vpc = true
  tags = {
    Description = "server1-cnl-EIP"
  }
}
```

📌 How to create a Security Group
📌 How to create VPC
📌 How to create VPC with Private and public Subnets
📌 How to create an EC2 instance
📌 How to create EC2 instance. While creating the ec2 instance itself how to configure/install the webserver in it.
---