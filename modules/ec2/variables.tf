variable "public_instance_ami" {
  type = string
}

variable "private_instance_ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "public_security_group_id" {
  type = string
}

variable "private_security_group_id" {
  type = string
}

variable "ssh_key_name" {
  type = string
}