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
  type        = list(object({
    service_delegation = bool
    name               = string
    address_prefixes   = list(string)

    delegation = object({
      name            = string
      actions         = list(string)
      delegation_name = string
    })
  }))
  default = [
    {
      name               = "storage_subnet"
      address_prefixes   = ["10.0.1.0/24"]
      service_delegation = true

      delegation = {
        delegation_name = "storage_delegation"
        name            = "Microsoft.DBforPostgreSQL/flexibleServers"
        actions         = ["Microsoft.Network/virtualNetworks/subnets/join/action", ]
      }
    },
    {
      name               = "web_app_subnet"
      address_prefixes   = ["10.0.2.0/24"]
      service_delegation = true

      delegation = {
        delegation_name = "app_delegation"
        name            = "Microsoft.Web/serverFarms"
        actions         = []
      }
    },
    {  
      name               = "blob_subnet"
      address_prefixes   = ["10.0.3.0/24"]
      service_delegation = false
      delegation         = null
    },
    {  
      name               = "gateway_subnet"
      address_prefixes   = ["10.0.4.0/24"]
      service_delegation = false
      delegation         = null
    }    
  ]
}

## PostgreSQL
# Variables related to the PostgreSQL server, database name, and admin credentials.

variable "postgresql_server_name" {
  description = "Name given to the postgresql server"
  type        = string
  default     = "cpi-postgresql"
}

variable "admin_username" {
  description = "postgreSQL username"
  type        = string
}

variable "admin_password" {
  description = "admin password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Nom de la base de données à créer."
  type        = string
  default     = "cpi-database"
}

variable "sku_name" {
  description = "Name of the Sku (ex: B_Standard_B1ms)."
  type        = string
  default     = "B_Standard_B1ms"
}

variable "storage_mb" {
  description = "Storage capacity in MB of the postgreSQL database"
  type        = number
  default     = 32768
}

variable "db_version" {
  description = "Server version PostgreSQL"
  type        = string
  default     = "16"
}

## Application Service
# Defines the application service plan, web app, and Docker container configuration.

variable "service_plan_name" {
  description = "Name of the service plan"
  type        = string
  default     = "api_plan"
}

variable "web_app_name" {
  description = "value"
  type        = string
  default     = "CPI-Web-App"
}

# Docker container related variables

variable "docker_registry_url" {
  description = "The docker registery url"
  type        = string
  default     = "https://ghcr.io"
}

variable "docker_image" {
  description = "The docker image"
  type        = string
  default     = "ghcr.io/fydxvi/cloud-computing-api:latest"
}

variable "docker_registry_username" {
  description = "The docker registery username"
  type        = string
}

variable "docker_registry_password" {
  description = "The docker registry password"
  type        = string
  sensitive   = true
}

## Blob storage

variable "blob_storage_name" {
  description = "Name of the blob storage"
  type        = string
  default     = "blob-storage-cpi"
}

variable "type" {
  description = "Type of the blob storage to be created"
  type        = string
  default     = "Block"
}

## Gateway
variable "gateway_name" {
    description = "Name of the gateway"
    type        = string  
    default     = "gateway-cpi"
}
