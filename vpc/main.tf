resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name = "Group21 VPC main"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Group21 VPC IG"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.az
  map_public_ip_on_launch = true
  tags = {
    Name = "Group21 VPC public subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.az
  tags = {
    Name = "Group21 VPC private subnet"
  }
}

resource "aws_security_group" "default" {
  vpc_id = aws_vpc.main.id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Group21 VPC security group"
  }
}
