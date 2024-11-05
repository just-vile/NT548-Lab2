output "public_security_group_id" {
  value = aws_security_group.public_sg.id
}

output "private_security_group_id" {
  value = aws_security_group.private_sg.id
}

output "default_security_group_id" {
  value = aws_security_group.default_sg.id
}