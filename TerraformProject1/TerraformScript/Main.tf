##########  TARGET GROUP FOR INSTANCES IN VPC NAMED Better-Target-Group  ###########################################################
resource "aws_lb_target_group" "Better-Target-Group" {
    health_check {
        interval = 10
        path = "/"
        protocol = "HTTP"
        timeout = 5
        healthy_threshold = 5
        unhealthy_threshold = 5
  }
   
    name     = "Better-Target-Group"
    port     = 80
    protocol = "HTTP"
    target_type = "instance"
    vpc_id   = aws_vpc.Better_VPC.id
}    


##########  TARGET GROUP FOR INSTANCES IN VPC NAMED Good-Target-Group  ###########################################################
resource "aws_lb_target_group" "Good-Target-Group" {
   health_check {
        interval = 10
        path = "/"
        protocol = "HTTP"
        timeout = 5
        healthy_threshold = 5
        unhealthy_threshold = 5
  }
  
    name     = "Good-Target-Group"
    port     = 80
    protocol = "HTTP"
    target_type = "instance"
    vpc_id   = aws_vpc.Good_VPC.id
}

##########  LISTENER FOR INSTANCES IN VPC NAMED Good-Listner  ###############################################################
resource "aws_lb_listener" "Good-Listner" {
  load_balancer_arn = aws_lb.Good-ALB-1.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.Good-Target-Group.arn
    type             = "forward"
  }
}

##########  LISTENER FOR INSTANCES IN VPC NAMED Better_Listner  ###############################################################
resource "aws_lb_listener" "Better-Listner" {
  load_balancer_arn = aws_lb.Better-ALB-2.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.Better-Target-Group.arn
    type             = "forward"
  }
}

##########  EC2 INSTANCES FOR VPC NAMED Better  #######################################################################
resource "aws_instance" "Better-Instance-1" {
  ami           = "ami-02d1e544b84bf7502"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.Better-SG-Instances.id}"]
  subnet_id = "${aws_subnet.Better-Private-1.id}"

  tags = {
    Name = "Better-Instance-1"
    Environment = "Production"
  }
}
resource "aws_instance" "Better-Instance-2" {
  ami           = "ami-02d1e544b84bf7502"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.Better-SG-Instances.id}"]
  subnet_id = "${aws_subnet.Better-Private-1.id}"

  tags = {
    Name        = "Better-Instance-2"
    Environment = "Production"
  }
}
resource "aws_instance" "Better-Instance-3" {
  ami           = "ami-02d1e544b84bf7502"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.Better-SG-Instances.id}"]
  subnet_id = "${aws_subnet.Better-Private-1.id}"

  tags = {
    Name        = "Better-Instance-3"
    Environment = "Production"
  }
}
resource "aws_instance" "Better-Instance-4" {
  ami           = "ami-02d1e544b84bf7502"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.Better-SG-Instances.id}"]
  subnet_id = "${aws_subnet.Better-Private-1.id}"

  tags = {
    Name        = "Better-Instance-4"
    Environment = "Production"
  }
}
resource "aws_instance" "Better-Instance-5" {
  ami           = "ami-02d1e544b84bf7502"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.Better-SG-Instances.id}"]
  subnet_id = "${aws_subnet.Better-Private-1.id}"

  tags = {
    Name        = "Better-Instance-5"
    Environment = "Production"
  }
}

##########  EC2 INSTANCES FOR VPC NAMED Good  #######################################################################
resource "aws_instance" "Good-Instance-1" {
  ami           = "ami-02d1e544b84bf7502"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.Good-SG-Instances.id}"]
  subnet_id = "${aws_subnet.Good-Private-1.id}"

  tags = {
    Name        = "Good-Instance-1"
    Environment = "Test"
  }
}
resource "aws_instance" "Good-Instance-2" {
  ami           = "ami-02d1e544b84bf7502"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.Good-SG-Instances.id}"]
  subnet_id = "${aws_subnet.Good-Private-1.id}"

  tags = {
    Name        = "Good-Instance-2"
    Environment = "Test"
  }
}
resource "aws_instance" "Good-Instance-3" {
  ami           = "ami-02d1e544b84bf7502"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.Good-SG-Instances.id}"]
  subnet_id = "${aws_subnet.Good-Private-1.id}"

  tags = {
    Name        = "Good-Instance-3"
    Environment = "Test"
  }
}
resource "aws_instance" "Good-Instance-4" {
  ami                    = "ami-02d1e544b84bf7502"
  instance_type          = "t2.micro"
  security_groups = ["${aws_security_group.Good-SG-Instances.id}"]
  subnet_id = "${aws_subnet.Good-Private-1.id}"

  tags = {
    Name        = "Good-Instance-4"
    Environment = "Test"
  }
}
resource "aws_instance" "Good_Instance_5" {
  ami                    = "ami-02d1e544b84bf7502"
  instance_type          = "t2.micro"
  security_groups        = ["${aws_security_group.Good-SG-Instances.id}"]
  subnet_id              = "${aws_subnet.Good-Private-1.id}"

  tags = {
    Name        = "Good-Instance-5"
    Environment = "Test"
  }
}