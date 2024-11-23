variable "rg_name" {
  description ="The name of the resource group in Azure"
  type        = string
}

variable "physical_loc" {
  description = "Location of the Azure resources"
  type        = string
}

variable "blob_storage_name" {
  description = "Name of the Blob storage"
  type        = string
}

variable "type" {
  description = "Type of the Blob storage to be created"
  type        = string
}

variable subnet_id {
  description = "The ID of the subnet where he Blob storage is living"
  type        = string
}