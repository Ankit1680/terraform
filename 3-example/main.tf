provider "aws" {
  region = "us-east-2"
}


resource "aws_instance" "example" {
  ami = "ami-0d1b5a8c13042c939"
  instance_type = "t2.micro"
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