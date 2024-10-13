module "vpc" {
  source              = "../modules/vpc"
  region              = var.region
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  project_name        = var.project_name
  tags                = var.tags
}

module "security_groups" {
  source       = "../modules/security_groups"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  tags         = var.tags
}



module "bastion" {
  source                          = "../modules/bastion"
  bastion_ami                     = var.bastion_ami
  bastion_instance_type           = var.bastion_instance_type
  project_name                    = var.project_name
  subnet_id                       = module.vpc.public_subnet
  ssh_key_name                    = var.ssh_key_name
  bastion_host_security_group_ids = [module.security_groups.vpc_bastion_host_security_group]
  tags                            = var.tags
}