variable "rgname" {
  type        = string
}

variable "name" {
  type        = string
}

variable "virtual_network_name" {
  type        = string
}

variable "address_prefixes" {
  type        = list
}

variable "service_endpoints" {
  type        = list
  default = []
}

variable "enforce_prvlinkepnsg" {
  type        = bool
  default = false
}
/*
variable "delegation_name" {
  type        = string
  default     = ""
}

variable "service_delegation_name" {
  type        = string
  default     = ""
}

variable "service_delegation_actions" {
  type        = list
  default     = []
}
*/
variable "delegation" {
  type = map(object({
    name = string,
    service_delegation = map(object({
      name = string,
      actions = list(string)
    }))
  }))
  default = null
}