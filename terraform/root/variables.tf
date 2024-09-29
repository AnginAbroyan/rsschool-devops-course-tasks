variable "region" {
  default = "eu-west-3"  # Paris
}

#Project
variable "project_name" {
  default = "my_project"
}


variable "tags" {
  default = {
    Project = "terraform"
    Terraform   = "true"
  }
}
