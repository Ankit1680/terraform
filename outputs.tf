output "public_ip" {
  description = "Instance public ip"
  sensitive = false
  value = aws_instance.instance.public_ip
}