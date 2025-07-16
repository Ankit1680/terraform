provider "aws" {
  region = local.region

}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.49"
    }
  }
}

terraform {

backend "s3" {
bucket = "devops224455-terraform-state"
key = "worksapces-example/terraform.tfstate"
region = "us-east-2"
encrypt = true
use_lockfile = true
}

}