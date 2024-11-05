output "public_instance_ip" {
  value = module.ec2.public_instance_ip
}

output "private_instance_id" {
  value = module.ec2.private_instance_id
}

output "nat_gateway_ip" {
  value = module.nat_gateway.nat_eip  # Xuất IP của NAT Gateway
}