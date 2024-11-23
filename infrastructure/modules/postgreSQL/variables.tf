
variable "postgresql_server_name" {
  description = "Name given to the postgresql server"
  type        = string
}

variable "rg_name" {
  description ="Name of the resource group in Azure"
  type        = string
}

variable "physical_loc" {
  description = "Physical location of the Azure resources"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the PostgreSQL server will be deployed."
  type        = string
}

variable "admin_username" {
  description = "Administrator username for the database"
  type        = string
}

variable "admin_password" {
  description = "Administrator password for the database"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Name of the database to be created within the PostgreSQL server."
  type        = string
}

variable "sku_name" {
  description = "Name of the SKU to be used for the PostgreSQL server."
  type        = string
}

variable "storage_mb" {
  description = "Storage of the PostgreSQL server in MB"
  type        = number
}

variable "db_version" {
  description = "PostgreSQL version to use for the server"
  type        = string
}

variable "vnet_id" {
  description = "ID of the Virtual Network where the PostgreSQL server will be deployed."
  type        = string
}

