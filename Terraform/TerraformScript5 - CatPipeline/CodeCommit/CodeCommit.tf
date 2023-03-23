provider "aws" {
  region     = "Your_Region"
  #access_key = ""
  #secret_key = ""
}


resource "aws_codecommit_repository" "catPipeline-CodeCommit2" {
  repository_name = "Your_Repository_Name"
  description     = "This time, we're cooking with Terraform!"
}