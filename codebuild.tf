resource "aws_codebuild_project" "build_project" {
  name        = "dotnet-app-build"
  description = "Build project for .NET application"

  source {
    type            = "GITHUB"
    location        = "https://github.com/soocrates/.NET-Application"
    git_clone_depth = 1
    buildspec = "buildspec.yml"
  }

  artifacts {
    type     = "S3"
    location = aws_s3_bucket.codepipeline_bucket.bucket
    path     = "artifacts"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:6.0"
    type         = "LINUX_CONTAINER"

    environment_variable {
      name  = "DOTNET_SKIP_FIRST_TIME_EXPERIENCE"
      value = "1"
    }

    environment_variable {
      name  = "DOTNET_CLI_TELEMETRY_OPTOUT"
      value = "1"
    }
  }

  service_role = aws_iam_role.codebuild_role.arn
}
