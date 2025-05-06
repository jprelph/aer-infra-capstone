output "load_balancer_address" {
  value = aws_lb.web-lb.dns_name
}

output "load_balancer_id" {
  value = aws_lb.web-lb.id
}
