provider "aws" {
  region = "us-east-1"
}

# terraform {
#   backend "s3" {
#     bucket = "s3://group21-secret-bucket"
#     key    = "s3://group21-secret-bucket/tfplan"
#     region = "us-east-1"
#   }
# }