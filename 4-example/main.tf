provider "aws" {
  region = "us-east-2"
}



resource "aws_db_instance" "mydb" {
  db_name        = "mydb"
  engine         = "postgress"
  engine_version = "15"
  instance_class = "db.t4g.micro"

  allocated_storage   = 10
  publicly_accessible = true
  skip_final_snapshot = true

  username = var.username
  password = var.password
}
