provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "devops224455-terraform-state"
  

#   lifecycle {
#     prevent_destroy = true
#   }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# resource "aws_s3_account_public_access_block" "terraform_state" {

#   block_public_acls = true
#   block_public_policy = true
#   ignore_public_acls = true
#   restrict_public_buckets = true
# }


# To use the backend file, 2 methods  -- 1. provide all details into terraform backend   or  2. use backend.hcl  and just add key in terraform backend
terraform {
  backend "s3" {
    bucket         = "devops224455-terraform-state"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    use_lockfile   = true
  }
}

