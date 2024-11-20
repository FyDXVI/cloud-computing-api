variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "vnet_address_space" {
  description = "Virtual network address space"
  type        = list(string)
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "physical_loc" {
  description = "Resource group and modules physical location"
  type        = string
}

variable "subnets" {
  description = "List of subnets"
  type = list(object({
    name = string
    address_prefixes = list(string)
  }))
}