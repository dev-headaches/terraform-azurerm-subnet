terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.80"
    }
  }
}

resource "azurerm_subnet" "subnet" {
  name                 = var.name
  resource_group_name  = var.rgname
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
  service_endpoints    = var.service_endpoints
  enforce_private_link_endpoint_network_policies = var.enforce_prvlinkepnsg
  dynamic "delegation" {
    for_each = var.delegation != null ? var.delegation : {}
    content {
      name = delegation.value.name #var.delegation_name
       dynamic "service_delegation" {
        for_each = delegation.value.service_delegation
        content {
          name = service_delegation.value.name #var.service_delegation_name
          actions = service_delegation.value.actions #var.service_delegation_actions
        }
      }
    }
  }
}