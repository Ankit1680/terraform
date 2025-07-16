variable "username" {
  description = "username for db"
  type = string
  sensitive = false
}

variable "password" {
  description = "password for db"
  type = string
  sensitive = true
}