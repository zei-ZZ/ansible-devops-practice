output "public_ip_address" {
  value = azurerm_public_ip.example.ip_address
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.example.name
}