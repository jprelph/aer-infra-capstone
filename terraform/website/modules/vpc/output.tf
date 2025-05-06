output "vpc_id" {
  value = aws_vpc.web-vpc.id
}

output "subnet_a_id" {
  value = aws_subnet.subnet-a.id
}

output "subnet_b_id" {
  value = aws_subnet.subnet-b.id
}
