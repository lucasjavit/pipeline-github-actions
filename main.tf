terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.2.0"
    }
  }

  backend "s3" {
    bucket = "bucket-project-vm"
    key    = "aws-vm-project/terraform.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = {
      owner      = "vyeiralucas"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "bucket-project-vm"
    key    = "aws-vm/terraform.tfstate"
    region = "sa-east-1"
  }
}
