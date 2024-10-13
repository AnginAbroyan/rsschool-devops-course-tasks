output "vpc_bastion_host_security_group" {
  value = aws_security_group.sg_bastion.id
}