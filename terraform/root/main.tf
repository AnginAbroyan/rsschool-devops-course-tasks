module "vpc" {
  source              = "../modules/vpc"
  region              = var.region
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  project_name        = var.project_name
  tags                = var.tags
}


module "bastion" {
  source                = "../modules/bastion"
  bastion_ami           = var.bastion_ami
  bastion_instance_type = var.bastion_instance_type
  project_name          = var.project_name
  subnet_id      = module.vpc.public_subnet
  ssh_key_name          = var.ssh_key_name
  bastion_host_security_group_ids = [module.bastion.bastion_host_instance_id]
  tags                  = var.tags
}