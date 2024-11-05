resource "aws_instance" "public_instance" {
  ami           = var.public_instance_ami
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  security_groups = [var.public_security_group_id]
  key_name      = var.ssh_key_name

  tags = {
    Name = "Public EC2 Instance"
  }
}

resource "aws_instance" "private_instance" {
  ami           = var.private_instance_ami
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  security_groups = [var.private_security_group_id]
  key_name      = var.ssh_key_name

  tags = {
    Name = "Private EC2 Instance"
  }
}