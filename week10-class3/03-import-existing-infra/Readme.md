- https://spacelift.io/blog/importing-exisiting-infrastructure-into-terraform
- create ec2 instance manually using AWS GUI
- create general provider.tf
- create ec2.tf with some empty values
- go  to aws gui console and get the running ec2 instance id
- run below command

```
terraform import aws_instance.myvm i-0bf7009815b68d3a7
```
- run terraform state list command