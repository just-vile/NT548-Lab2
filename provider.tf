provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "group21-secret-bucket"
    key    = "group21-secret-bucket/terraform.tfstate"
    region = "us-east-1"
  }
}