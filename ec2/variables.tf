variable "ami" {}
variable "instance_type" {}
variable "vpc_id" {
  description = "The ID of the VPC where the EC2 instances will be deployed"
  type        = string
}
variable "public_subnet_id" {}
variable "private_subnet_id" {}
variable "my_ip" {
  type = string
}
variable "key_name" {
  
}