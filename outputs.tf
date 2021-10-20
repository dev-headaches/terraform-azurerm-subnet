output "subnet_id" {
  value       = azurerm_subnet.subnet.id
  description = "the resource ID of the subnet"
}

output "subnet_name" {
  value       = azurerm_subnet.subnet.name
  description = "the name of the subnet"
}

output "address_prefixes" {
  value       = azurerm_subnet.subnet.address_prefixes
  description = "the address prefixes of the subnet"
}