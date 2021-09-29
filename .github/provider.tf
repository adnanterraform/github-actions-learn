provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket = "adnan-terraform-project-github-actions-state"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}


