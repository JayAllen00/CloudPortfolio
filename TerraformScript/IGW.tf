resource "aws_internet_gateway" "Good-Internet-Gateway-1" {
  vpc_id = aws_vpc.Good_VPC.id

  tags = {
    Name = "Good-Internet-Gateway-1"
  }
}

resource "aws_internet_gateway" "Better_Internet_Gateway_2" {
  vpc_id = aws_vpc.Better_VPC.id

  tags = {
    Name = "Better-Internet-Gateway-2"
  }
}