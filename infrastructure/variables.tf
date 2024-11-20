## General

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
    name = string
    address_prefixes = list(string)
  }))
  default = [
    {
      name = "storage_subnet"
      address_prefixes = ["10.0.1.0/24"]
    }
  ]
}

