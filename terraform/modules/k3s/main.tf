# EC2 Instance for Master Node (k3s Server)
resource "aws_instance" "master" {
  ami                    = var.k3s_ami
  instance_type          = var.k3s_instance_type
  subnet_id              = var.subnet_id[1] //private subnet
  vpc_security_group_ids = var.sg_nodes_id
  key_name               = var.ssh_key_name
  tags                   = merge(var.tags, { Name = "${var.project_name}-master" })
}

# EC2 Instance for Worker Node (k3s Agent)
resource "aws_instance" "worker" {
  ami                    = var.k3s_ami
  instance_type          = var.k3s_instance_type
  subnet_id              = var.subnet_id[1] //private subnet
  vpc_security_group_ids = var.sg_nodes_id
  key_name               = var.ssh_key_name
  tags                   = merge(var.tags, { Name = "${var.project_name}-worker" })
}