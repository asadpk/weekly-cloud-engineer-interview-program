output "vpc_id" {

  value = aws_vpc.vijayprod.id
}

output "public_subnet_id" {

  value = aws_subnet.public_subnet.id
}
