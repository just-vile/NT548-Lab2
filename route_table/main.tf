resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
  tags = {
    Name = "Group21 route table public"
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public.id
  
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  tags = {
    Name = "Group21 route table private"
  }
}

resource "aws_route_table_association" "private_association" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.private.id
}

# Route for private subnet via NAT Gateway
resource "aws_route" "private_route_nat" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_nat_gateway" "nat" {
  subnet_id     = var.public_subnet_id
  allocation_id = var.eip
  tags = {
    Name = "Group21 route table nat gateway"
  }
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
}
