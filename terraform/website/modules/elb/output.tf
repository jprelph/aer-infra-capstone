output "load_balancer_address" {
  value = aws_lb.web-lb.dns_name
}

output "load_balancer_id" {
  value = aws_lb.web-lb.id
}

output "target_group_arn" {
  value = aws_lb_target_group.web-lb-tg.arn
}
