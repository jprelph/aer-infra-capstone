output "public_ip_address" {
  value       = aws_instance.ec2.public_ip
  description = "The public IP address of the server."
}
