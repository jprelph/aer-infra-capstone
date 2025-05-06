resource "aws_lb" "web-lb" {
  name               = "web-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.allow_ssh_http_id]
  subnets            = [var.subnet_a_id, var.subnet_b_id]

  enable_deletion_protection = true

  tags = {
    Name = "web-lb"
  }
}
