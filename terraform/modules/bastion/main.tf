resource "aws_instance" "bastion" {
  ami              = var.bastion_ami
  instance_type    = var.bastion_instance_type
  public_subnet_id = var.subnet_id
  tags             = merge(var.tags, { Name = "${var.project_name}-bastion" })
  key_name         = var.ssh_key_name
}