resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "Fujitech-codepipeline-artifacts-bucket" # Name of the S3 bucket for CodePipeline artifacts
}
