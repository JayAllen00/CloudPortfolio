##########  ALB FOR VPC NAMED Good-ALB-1  #################################################################################
resource "aws_lb" "Good-ALB-1" {
  name               = "GoodALB1"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Good-SG-ALB.id]
  subnets            = [aws_subnet.Good-Private-1.id, aws_subnet.Good-Public-2.id]

  tags = {
    Name        = "Good-ALB-1"
    Environment = "Test"
  }
}

##########  ALB FOR VPC NAMED Better-ALB-2  #################################################################################
resource "aws_lb" "Better-ALB-2" {
  name               = "Better-ALB-2"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Better-SG-ALB.id]
  subnets            = [aws_subnet.Better-Private-1.id, aws_subnet.Better-Public-2.id]


  tags = {
    Name        = "Better-ALB-2"
    Environment = "Production"
  }
}