# Tạo Elastic IP (EIP) cho NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# Tạo NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.public_subnet_id
  tags = {
    Name = "NAT Gateway"
  }
}