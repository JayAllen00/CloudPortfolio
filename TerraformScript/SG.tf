##########  SECURITY GROUP FOR THE ALB IN VPC NAMED Good-SG-ALB  ##################################################
resource "aws_security_group" "Good-SG-ALB" {
  name        = "Good-SG-ALB"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Good_VPC.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Good-SG-ALB"
    Environment = "Test"
  }
}

##########  SECURITY GROUP FOR THE INSTANCES IN VPC NAMED Good_SG_Instances  #################################################
resource "aws_security_group" "Good-SG-Instances" {
  name        = "Good-SG-Instances"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Good_VPC.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Good-SG-Instances"
    Environment = "Test"
  }
}

##########  SECURITY GROUP FOR ALB IN VPC NAMED Better-SG-ALB  ##########################################################
resource "aws_security_group" "Better-SG-ALB" {
  name        = "Better-SG-ALB"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Better_VPC.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Better-SG-ALB"
    Environment = "Production"
  }
}

##########  SECURITY GROUP FOR INSTANCES IN VPC NAMED Better-SG-Instances  ####################################################
resource "aws_security_group" "Better-SG-Instances" {
  name        = "Better-SG-Instances"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Better_VPC.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Better-SG-Instances"
    Environment = "Production"
  }
}
