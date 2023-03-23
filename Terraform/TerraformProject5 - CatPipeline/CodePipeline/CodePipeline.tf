data "aws_s3_bucket" "Your_S3_Bucketname" {
  bucket = "Your_S3_Bucketname"
}

resource "aws_codepipeline" "catPipeline" {
  name     = "catPipeline"
  role_arn = aws_iam_role.catpipeline_role.arn

  artifact_store {
    location = data.aws_s3_bucket.Your_S3_Bucketname.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        RepositoryName       = "Your_Repository_Name"
        BranchName           = "master"
        PollForSourceChanges = true
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = "catpipeline-build"
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      input_artifacts = ["build_output"]
      version         = "1"

      configuration = {
        ClusterName = "catCluster"
        ServiceName = "service"
        #ActionMode     = "REPLACE_ON_FAILURE"
        #Capabilities   = "CAPABILITY_AUTO_EXPAND,CAPABILITY_IAM"
        FileName = "imagedefinitions.json"
        #TemplatePath   = "build_output::sam-templated.yaml"
      }
    }
  }
}

resource "aws_iam_role" "catpipeline_role" {
  name = "catpipeline_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "test-attach2" {
  name       = "test-attach2"
  roles      = [aws_iam_role.catpipeline_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
