output "ec2_instance_id" {
  value = aws_instance.my_vm.id
}

output "ec2_private_dns" {
  value = aws_instance.my_vm.private_dns
}

output "ec2_instance_private_ip" {
  value = aws_instance.my_vm.private_ip
}

output "ec2_instance_public_ip" {
  value = aws_instance.my_vm.public_ip
}
