## General

variable "subscription_id" {
  description = "Azure subscription ID"
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
