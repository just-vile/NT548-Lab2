resource "aws_vpc" "main_vpc" {
  # checkov:skip=CKV2_AWS_12
  # checkov:skip=CKV2_AWS_11
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Main VPC"
  }
}
