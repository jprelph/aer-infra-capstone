resource "aws_lb" "web-lb" {
  name               = "web-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.allow_ssh_http_id]
  subnets            = [var.subnet_a_id, var.subnet_b_id]

  enable_deletion_protection = false

  tags = {
    Name = "web-lb"
  }
}

resource "aws_lb_target_group" "web-lb-tg" {
  name        = "web-lb-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
}

resource "aws_lb_listener" "my_alb_listener" {
 load_balancer_arn = aws_lb.web-lb.arn
 port              = "80"
 protocol          = "HTTP"

 default_action {
   type             = "forward"
   target_group_arn = aws_lb_target_group.web-lb-tg.arn
 }
}

