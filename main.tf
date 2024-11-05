variable "key_name" {
  description = "The name of the existing key pair to use for SSH access"
  type        = string
}

module "vpc" {
  source = "./vpc"
  cidr_block         = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  az = "us-east-1a"
}

module "route_table" {
  source = "./route_table"
  vpc_id = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
  internet_gateway_id = module.vpc.internet_gateway_id
  eip = aws_eip.nat_eip.id
}

module "ec2" {
  source = "./ec2"
  ami = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  vpc_id = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
  my_ip = "58.187.185.59"
  key_name= "ssh_rsa_keypair"
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

