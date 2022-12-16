output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.web_server.public_ip
}

output "no_of_cpu_cores" {
  value = aws_instance.web_server.cpu_core_count
}

output "host_id" {
  value = aws_instance.web_server.host_id
}

output "instance-type" {
  value = aws_instance.web_server.instance_type
}

output "ipaddress" {
  value = aws_instance.web_server.private_ip
}
