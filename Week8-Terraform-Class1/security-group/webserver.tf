resource "aws_instance" "vijayec2" {
  ami                    = "ami-0b0dcb5067f052a63"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]
  key_name               = "terraform"
  tags = {
    Name = "Cloudnloud Tech Community"
  }

  user_data = <<EOF
#!/bin/bash
sudo amazon-linux-extras install epel -y
sudo /bin/yum install httpd -y
sudo /bin/systemctl restart httpd
sudo /bin/systemctl enable httpd
sudo su
sudo /bin/echo "Hello world " >/var/www/html/index.html
instance_ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
sudo echo $instance_ip >>/var/www/html/index.html
ls
EOF

}

