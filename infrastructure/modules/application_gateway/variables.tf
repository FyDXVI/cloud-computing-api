variable "rg_name" {
  description = "The name of the resource group in Azure"
  type        = string
}

variable "physical_loc" {
  description = "Physical location of the Azure resources"
  type        = string
}

variable "gateway_name" {
  description = "Name of the gateway"
  type        = string  
}

variable "subnet_id" {
  description = "ID of the subnet wher the gateway is deployed"
  type        = string
}

variable "app_service_fqdn" {
  description = "App service Fully Qualified Domain Name"
  type        = string
}