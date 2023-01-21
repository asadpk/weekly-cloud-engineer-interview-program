aws apigateway with lambda function creation

Requirements

    * Terraform
    * aws access key
    * aws secret key

Runtime variables

      accessKey       = ""
      secretKey       = ""
      region          = "us-east-1"
      api-gateway-name= ""
      vpc_cidr        = "10.0.0.0/16"  # do not change
      project         = "duckduckgo"
      key-name        = "xps-add"

commands

    1. terraform version
    2. terraform init
    3. terraform plan -var-file="config.tfvars"
    4. terraform apply -var-file="config.tfvars"
    5. terraform destroy -var-file="config.tfvars"


> VPC Peering allows connectivity between two VPCs. It's just like normal routing between network segments.

> VPC PrivateLink allows you to publish an "endpoint" that others can connect with from their own VPC. It's similar to a normal VPC Endpoint, but instead of connecting to an AWS service, people can connect to your endpoint. Think of it as a way to publish a private API endpoint without having to go via the Internet.

- In both cases, no traffic goes across the Internet. Connectivity is directly between the VPCs.



# Let's understand this by a real-life use case

> Suppose You have your Own VPC (created by you using your own AWS Account) in which you have few EC2 instances that wants to communicate with instances running in your Client's VPC - obviously this VPC is created by your client using his/her AWS Account - Use VPC Peering to achieve this communication requirement

> Now consider you have your OWN VPC (created by you using your own AWS Account) with EC2 Instance running inside it, and using the same AWS account you uploaded some files in S3. And your EC2 Instance now wants to read content of the file in S3.

> In this case you will configure VPC Endpoint - which uses PrivateLink technology - AWS PrivateLink allows you to privately access services hosted on the AWS network in a highly available and scalable manner, without using public IPs and without requiring the traffic to traverse the internet.

