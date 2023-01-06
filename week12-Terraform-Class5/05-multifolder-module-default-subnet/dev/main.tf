module "my_vpc" {
  source       = "../modules/vpc"
  vpc_cidr     = "30.0.0.0/16"
  subnet_block = "30.0.1.0/24"
}

module "my_ec2" {
  source        = "../modules/ec2"
  instance_type = "t2.micro"

}

