provider "aws" {
  region = var.region
}


terraform {
  #The backend
  backend "s3" {
    bucket         = "terraform-rs-bucket--anabroyan123456"
    key            = "terraform/state"
    region         = "eu-west-3" # Adjust this to your region
    encrypt        = true
    dynamodb_table = "DynamoDB-table-state-locks123456"
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.9.0"
    }
  }
  required_version = ">= 1.5.2"
}