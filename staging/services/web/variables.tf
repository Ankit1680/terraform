variable "server_port" {
  default = 8080
  description = "Server port to access the web app"
  type = number
  sensitive = true
# validation {
#   condition = var.server_port > 0 && var.server_port < 65536
#   error_message = "Server port must be 1-65536"
# }

}