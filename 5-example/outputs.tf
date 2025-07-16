output "db_url" {
  value = aws_db_instance.mydb.address
}

output "db_port" {
  value = aws_db_instance.mydb.port
}