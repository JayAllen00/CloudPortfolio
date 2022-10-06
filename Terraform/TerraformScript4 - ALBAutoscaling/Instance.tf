resource "aws_instance" "instance1" {
  ami           = "ami-778696"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.myinstance.id}"]
  subnet_id = "${aws_subnet.main-private-1.id}"

  tags = {
    Name = "Instance1"
    Environment = "Production"
  }
}