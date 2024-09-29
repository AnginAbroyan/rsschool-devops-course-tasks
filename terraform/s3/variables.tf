#Project
variable "project_name" {
  default = "my_project"
}

variable "tags" {
  default = {
    Project = "terraform"
  }
}