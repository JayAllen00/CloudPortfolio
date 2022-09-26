resource "aws_lb" "traffic-control" {
  name               = "traffic-control"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-securitygroup.id]
  subnets            = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]

}
