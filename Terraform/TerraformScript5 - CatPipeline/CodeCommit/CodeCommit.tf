provider "aws" {
  region     = "Your_Region"
  #access_key = ""
  #secret_key = ""
}


resource "aws_codecommit_repository" "Your_Repository_Name" {
  repository_name = "Your_Repository_Name"
  description     = "This time, we're cooking with Terraform!"
}