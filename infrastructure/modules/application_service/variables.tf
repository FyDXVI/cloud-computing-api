variable "service_plan_name" {
    description = "Name of the service plan"
    type        = string
}

variable "rg_name" {
    description = "value"
    type        = string
}

variable "physical_loc" {
    description = "value"
    type        = string
}

variable "web_app_name" {
    description = "value"
    type        = string
}

variable subnet_id {
    description = "value"
    type        = string
}

## PostGre SQL connection

variable "database_host" {
  description = "DB hostname"
  type = string
}

variable "database_port" {
  description = "DB port number"
  type = number
}

variable "database_name" {
  description = "DB name"
  type = string
}

variable "admin_username" {
  description = "Login used to connect to db"
  type = string
}

variable "admin_password" {
  description = "Password used to connect to db"
  type = string
}