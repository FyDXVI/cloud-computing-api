## General - provider

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
  sensitive   = true
}

## Resource group

variable "rg_name" {
  description = "Resource group name"
  type        = string
  default     = "Cloud_cpi"
}

variable "physical_loc" {
  description = "Resource group and modules physical location"
  type        = string
  default     = "France Central"
}

## Virtual networks

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  default     = "Cloud_cpi_vnet"
}

variable "vnet_address_space" {
  description = "Virtual network address space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

## Sub networks

variable "subnets" {
  description = "List of subnets"
  type = list(object({
    service_delegation = bool
    name = string
    address_prefixes = list(string)
  }))
  default = [
    {
      name = "storage_subnet"
      address_prefixes = ["10.0.1.0/24"]
      service_delegation = true
    }
  ]
}

## PostgreSQL

variable "postgresql_server_name" {
  description = "Name given to the postgresql server"
  type        = string
  default     = "cpi-postgresql"
}

variable "admin_username" {
  description = "Nom d'utilisateur administrateur pour PostgreSQL."
  type        = string
}

variable "admin_password" {
  description = "Mot de passe administrateur PostgreSQL sécurisé."
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Nom de la base de données à créer."
  type        = string
  default     = "cpi-database"
}

variable "sku_name" {
  description = "Nom du SKU (ex: B_Standard_B1ms)."
  type        = string
  default = "B_Standard_B1ms"
}

variable "storage_mb" {
  description = "Capacité de stockage en Mo pour PostgreSQL."
  type        = number
  default = 32768
}

variable "db_version" {
  description = "Version du serveur PostgreSQL"
  type        = string
  default = "13"
}

