variable "vpc_id" {
  type = string
}

variable "allowed_ssh_cidr" {
  type = string
  default = "0.0.0.0/0"
}

variable "public_security_group_id" {
  type = string
}