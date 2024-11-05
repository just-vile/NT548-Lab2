variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}

variable "public_instance_ami" {
  type    = string
  default = "ami-0866a3c8686eaeeba"
}

variable "private_instance_ami" {
  type    = string
  default = "ami-0866a3c8686eaeeba"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ssh_key_name" {
  type    = string
  description = "SSH Key"
  default = "mykey"
}