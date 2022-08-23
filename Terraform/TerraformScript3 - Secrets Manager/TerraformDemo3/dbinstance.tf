resource "aws_db_instance" "MoneyInstance1" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "MoneyInstance1"
  username             = local.db_creds.username
  password             = local.db_creds.password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}