variable "aws_region" {
  description = "The AWS region to create the VPC in."
  default     = "us-east-1"
}


variable "vpc-cidr" {
  default = "10.0.0.0/16"
}

variable "pubsubcidr" {
  default = "10.0.1.0/24"
}

variable "prisubcidr" {
  default = "10.0.2.0/24"
}
