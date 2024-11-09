resource "aws_security_group" "public_sg" {
  # checkov:skip=CKV_AWS_24
  # checkov:skip=CKV2_AWS_5
  vpc_id = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
    description = "Enable Local Machine to SSh to EC2"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = " Allow EC2 to connect to Internet"
  }
  tags = {
    Name = "Public EC2 SG"
  }
  description = "Enable Local Machine to SSH to EC2 and Allow EC2 to connect to Internet"
}

resource "aws_security_group" "private_sg" {
  # checkov:skip=CKV_AWS_24
  # checkov:skip=CKV2_AWS_5
  vpc_id = var.vpc_id
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [var.public_security_group_id]
    description = "Enable Machines from Public Security Group to SSH to EC2"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow EC2 to connect to Internet"
  }
  tags = {
    Name = "Private EC2 SG"
  }
  description = "Enable Machines from Public Security Group to SSH to EC2 and Allow EC2 to connect to Internet"
}

resource "aws_security_group" "default_sg" {
  # checkov:skip=CKV2_AWS_5
  vpc_id = var.vpc_id
  tags = {
    Name = "Default Security Group"
  }
  description = "Default Security group"
}