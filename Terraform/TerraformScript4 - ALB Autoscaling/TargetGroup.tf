resource "aws_lb_target_group" "TargetGRPALB" {
  name     = "TargetGRPALB"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

 health_check {
        interval = 10
        path = "/"
        protocol = "HTTP"
        timeout = 5
        healthy_threshold = 5
        unhealthy_threshold = 5
  }

} 


resource "aws_lb_target_group_attachment" "ALBAttach" {
  target_group_arn = aws_lb_target_group.TargetGRPALB.arn
  target_id        = aws_instance.instance1.id
  port             = 80
}
