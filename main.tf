module "vpc" {
  source  = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "subnet" {
  source              = "./modules/subnet"
  vpc_id              = module.vpc.vpc_id
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}

resource "aws_internet_gateway" "igw" {
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "Main Internet Gateway"
  }
}

module "nat_gateway" {
  source           = "./modules/nat_gateway"
  public_subnet_id = module.subnet.public_subnet_id
  vpc_id           = module.vpc.vpc_id
  internet_gateway_id = aws_internet_gateway.igw.id
}

# Gọi module Route Table
module "route_table" {
  source            = "./modules/route_table"
  vpc_id            = module.vpc.vpc_id
  internet_gateway_id = aws_internet_gateway.igw.id
  nat_gateway_id    = module.nat_gateway.nat_gateway_id  # Truyền NAT Gateway ID
  public_subnet_id  = module.subnet.public_subnet_id
  private_subnet_id = module.subnet.private_subnet_id
}

module "security_group" {
  source               = "./modules/security_group"
  vpc_id               = module.vpc.vpc_id
  allowed_ssh_cidr     = "0.0.0.0/0"  # Hoặc IP cụ thể
  public_security_group_id = module.security_group.public_security_group_id
}

module "ec2" {
  source                   = "./modules/ec2"
  public_instance_ami       = var.public_instance_ami
  private_instance_ami      = var.private_instance_ami
  instance_type             = var.instance_type
  public_subnet_id          = module.subnet.public_subnet_id
  private_subnet_id         = module.subnet.private_subnet_id
  public_security_group_id  = module.security_group.public_security_group_id
  private_security_group_id = module.security_group.private_security_group_id
  ssh_key_name              = "mykey"
}