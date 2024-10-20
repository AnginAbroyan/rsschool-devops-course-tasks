variable "region" {
  default = "eu-west-3" # Frankfurt
}

#VPC
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
    "10.0.64.0/24"
  ]
}

#Project
variable "project_name" {
  default = "rs_school"
}


variable "tags" {
  default = {
    Project = "task2"
  }
}