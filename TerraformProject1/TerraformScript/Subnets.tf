##########  VPC FOR TEST ENVIRONMENT NAMED Good  ####################################################################
resource "aws_vpc" "Good_VPC" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Good_VPC"
    Environment = "Test"
  }
  }

##########  VPC FOR PRODUCTION ENVIRONMENT NAMED Better  ##############################################################
  resource "aws_vpc" "Better_VPC" {
  cidr_block       = "10.2.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Better_VPC"
    Environment = "Production"
  }
  }

##########  SUBNETS FOR VPC NAMED Good  #############################################################################
  resource "aws_subnet" "Good-Public-1" {
  vpc_id     = aws_vpc.Good_VPC.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"
  cidr_block = "10.1.1.0/24"
  
  tags = {
    Name = "Good-Public-1"
    Try = "A1"
    Final = "B1"    
    Environment = "Test"
  }
}
  resource "aws_subnet" "Good-Public-2" {
  vpc_id     = aws_vpc.Good_VPC.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-2b"
  cidr_block = "10.1.2.0/24"
  
  tags = {
    Name = "Good-Public-2"
    Try = "A2"
    Final = "B2"    
    Environment = "Test"
  }
}
  resource "aws_subnet" "Good-Public-3" {
  vpc_id     = aws_vpc.Good_VPC.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-2c"
  cidr_block = "10.1.3.0/24"
  
  tags = {
    Name = "Good-Public-3"
    Try = "A3"
    Final = "B3"  
    Environment = "Test"  
  }
}
  resource "aws_subnet" "Good-Private-1" {
  vpc_id     = aws_vpc.Good_VPC.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"
  cidr_block = "10.1.4.0/24"
  
  tags = {
    Name = "Good-Private-1"
    Try = "A4"
    Final = "B4"    
    Environment = "Test"
  }
}
  resource "aws_subnet" "Good-Private-2" {
  vpc_id     = aws_vpc.Good_VPC.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-2b"
  cidr_block = "10.1.5.0/24"
  
  tags = {
    Name = "Good-Private-2"
    Try = "A5"
    Final = "B5"    
    Environment = "Test"
  }
}
  resource "aws_subnet" "Good-Private-3" {
  vpc_id     = aws_vpc.Good_VPC.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-2c"
  cidr_block = "10.1.6.0/24"
  
  tags = {
    Name = "Good-Private-3"
    Try = "A6"
    Final = "B6"    
    Environment = "Test"
  }
}
  resource "aws_subnet" "Good-Private-4" {
  vpc_id     = aws_vpc.Good_VPC.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"
  cidr_block = "10.1.7.0/24"
  
  tags = {
    Name = "Good-Private-4"
    Try = "A7"
    Final = "B7"    
    Environment = "Test"
  }
}

##########  SUBNETS FOR VPC NAMED Better  #############################################################################
  resource "aws_subnet" "Better-Public-1" {
  vpc_id     = aws_vpc.Better_VPC.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"
  cidr_block = "10.2.1.0/24"
  
  tags = {
    Name = "Better-Public-1"
    Try = "A1"
    Final = "B1"    
    Environment = "Production"
  }
}
  resource "aws_subnet" "Better-Public-2" {
  vpc_id     = aws_vpc.Better_VPC.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-2b"
  cidr_block = "10.2.2.0/24"
  
  tags = {
    Name = "Better-Private-2"
    Try = "A2"
    Final = "B2"    
    Environment = "Production"
  }
}
  resource "aws_subnet" "Better-Public-3" {
  vpc_id     = aws_vpc.Better_VPC.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-2c"
  cidr_block = "10.2.3.0/24"
  
  tags = {
    Name = "Better-Public-3"
    Try = "A3"
    Finisher = "B3"    
    Environment = "Production"
  }
}
  resource "aws_subnet" "Better-Private-1" {
  vpc_id     = aws_vpc.Better_VPC.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"
  cidr_block = "10.2.4.0/24"
  
  tags = {
    Name = "Better-Private-1"
    Try = "A4"
    Final = "B4"   
    Environment = "Production" 
  }
}
  resource "aws_subnet" "Better-Private-2" {
  vpc_id     = aws_vpc.Better_VPC.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-2b"
  cidr_block = "10.2.5.0/24"
  
  tags = {
    Name = "Better-Private-2"
    Try = "A5"
    Final = "B5"    
    Environment = "Production"
  }
}
  resource "aws_subnet" "Better-Private-3" {
  vpc_id     = aws_vpc.Better_VPC.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-2c"
  cidr_block = "10.2.6.0/24"
  
  tags = {
    Name = "Better-Private-3"
    Try = "A6"
    Final = "A6"    
    Environment = "Production"
  }
}
  resource "aws_subnet" "Better-Private-4" {
  vpc_id     = aws_vpc.Better_VPC.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"
  cidr_block = "10.2.7.0/24"
  
  tags = {
    Name = "Better-Private-4"
    Try = "A7"
    Final = "B7"    
    Environment = "Production"
  }
}