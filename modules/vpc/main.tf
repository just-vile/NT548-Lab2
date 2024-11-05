resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Main VPC"
  }
}

data "aws_security_group" "default_sg" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.main_vpc.id]
  }

  filter {
    name   = "group-name"
    values = ["default"]
  }
}

resource "aws_security_group_rule" "default_sg_restrict_inbound" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = []
  security_group_id = data.aws_security_group.default_sg.id
}

resource "aws_security_group_rule" "default_sg_restrict_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = []
  security_group_id = data.aws_security_group.default_sg.id
}