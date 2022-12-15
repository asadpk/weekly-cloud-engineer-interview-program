module "vpc" {
  source = "git::https://github.com/fstuck37/terraform-aws-vpc.git"
  acctnum="${var.acct-num}"
  region = "${var.region}"
  vpc-cidrs = ["${var.vpc-cidrs}"]
  name-vars = "${var.name-vars}"
  subnets = "${var.subnets}"
  subnet-order = "${var.subnet-order}"
  deploy_natgateways = "true"
  tags = "${var.tags}"
}

variable "acct-num" { 
  default = "1234567890123"
}

variable "region" {
  default = "us-east-1"
}

variable "vpc-cidrs" {
  default = ["10.0.0.0/21"]
}

variable "name-vars" {
  type = "map"
  default = {
    account = "geek37"
    name = "dev"
  }
}

variable "subnets" {
  type = "map"
  default = {
    pub = "10.0.0.0/24"
    web = "10.0.1.0/24"
    app = "10.0.2.0/24"
    db  = "10.0.3.0/24"
    mgt = "10.0.4.0/24"
  }
}

variable "subnet-order" {
  type = "list"
  default = ["pub", "web", "app", "db", "mgt"]
}

variable "tags" {
  type = "map"
  default = {
    dept = "Development"
    Billing = "12345"
    Contact = "F. Stuck"
    Environment = "POC"
    Notes  = "This is a test environment"
  }
}