
variable "postgresql_server_name" {
  description = "Name given to the postgresql server"
  type        = string
}

variable "rg_name" {
  description ="The name of the resource group in Azure"
  type        = string
}

variable "physical_loc" {
  description = "Location of the Azure resources"
  type        = string
}

variable "subnet_id" {
  description = "ID du sous-réseau délégué pour PostgreSQL Flexible Server."
  type        = string
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
}

variable "sku_name" {
  description = "Nom du SKU (ex: B_Standard_B1ms)."
  type        = string
}

variable "storage_mb" {
  description = "Capacité de stockage en Mo pour PostgreSQL."
  type        = number
}

variable "db_version" {
  description = "Version du serveur PostgreSQL"
  type        = string
}

variable "vnet_id" {
  description = "ID du réseau virtuel pour la liaison DNS privée."
  type        = string
}

