resource "aws_instance" "bastion" {
  ami           = var.bastion_ami
  instance_type = var.bastion_instance_type
  subnet_id     = var.subnet_id[1]
  vpc_security_group_ids  = var.bastion_host_security_group_ids
  tags          = merge(var.tags, { Name = "${var.project_name}-bastion" })
  key_name      = var.ssh_key_name
}