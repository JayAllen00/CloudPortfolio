resource "aws_lb_listener" "Listner1" {
  load_balancer_arn = aws_lb.traffic-control.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TargetGRPALB.arn
  }
  
  }