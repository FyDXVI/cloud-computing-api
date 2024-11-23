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
  type        = string
}

variable "database_port" {
  description = "DB port number"
  type        = number
}

variable "database_name" {
  description = "DB name"
  type        = string
}

variable "admin_username" {
  description = "Login used to connect to db"
  type        = string
}

variable "admin_password" {
  description = "Password used to connect to db"
  type        = string
}

## Docker connection

variable "docker_registry_url" {
  description = "The docker registery url"
  type        = string
}

variable "docker_image" {
  description = "The docker image"
  type        = string
}

variable "docker_registry_username" {
  description = "The docker registery username"
  type        = string
  sensitive   = true
}

variable "docker_registry_password" {
  description = "The docker registry password"
  type        = string
  sensitive   = true
}

## blob storage

variable "storage_account_id" {
  description = "The ID of the storage account (Blob storage)"
  type        = string
}

variable "storage_url" {
  description = "The URL of the Blob storage"
  type        = string
}

variable "storage_container_name" {
  description = "Name of the Blob storage container"
  type        = string
}