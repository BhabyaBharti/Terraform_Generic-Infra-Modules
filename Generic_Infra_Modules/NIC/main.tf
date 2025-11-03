resource "azurerm_network_interface" "nic" {

  for_each = var.nics

  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                                               = each.value.ip_configuration.ip_config_name
    subnet_id                                          = each.value.ip_configuration.subnet_id
    private_ip_address_allocation                      = each.value.ip_configuration.private_ip_address_allocation
    gateway_load_balancer_frontend_ip_configuration_id = each.value.ip_configuration.gateway_load_balancer_frontend_ip_configuration_id
    private_ip_address_version                         = each.value.ip_configuration.private_ip_address_version
    public_ip_address_id                               = each.value.ip_configuration.public_ip_address_id
    primary                                            = each.value.ip_configuration.primary
    private_ip_address                                 = each.value.ip_configuration.private_ip_address

  }

  auxiliary_mode                 = each.value.auxiliary_mode
  auxiliary_sku                  = each.value.auxiliary_sku
  dns_servers                    = each.value.dns_servers
  edge_zone                      = each.value.edge_zone
  ip_forwarding_enabled          = each.value.ip_forwarding_enabled
  accelerated_networking_enabled = each.value.accelerated_networking_enabled
  internal_dns_name_label        = each.value.internal_dns_name_label

  tags = {
    environment = each.value.environment
  }
}
