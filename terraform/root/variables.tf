variable "region" {
  default = "eu-west-3" # Paris
}

#VPC variables
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = [
    "10.0.0.0/24",
    "10.0.36.0/24",
  ]
}

variable "private_subnet_cidr" {
  default = [
    "10.0.64.0/24",
    "10.0.128.0/24"
  ]
}

#Project variables
variable "project_name" {
  default = "rs_school"
}


variable "tags" {
  default = {
    Project = "task3"
  }
}


###Bastion variables

variable "bastion_ami" {
  default = "ami-045a8ab02aadf4f88"
}

variable "bastion_instance_type" {
  default = "t2.micro"
}

variable "ssh_key_name" {
  description = "AWS EC2 Key pair"
  type        = string
  default     = "sshkey"
}


///K3S variables

variable "k3s_ami" { default = "ami-045a8ab02aadf4f88" }
variable "k3s_instance_type" { default = "t2.micro" }
