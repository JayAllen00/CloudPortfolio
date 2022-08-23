data "aws_secretsmanager_secret_version" "db_creds" {
  secret_id = "db_creds"
}