data "azurerm_subnet" "subnet_id" {
  depends_on           = [module.Subnet, module.VNet]
  for_each             = var.Subnet
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
}

data "azurerm_public_ip" "pip_id" {
  depends_on          = [module.Public_IP]
  for_each            = var.pips
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}

data "azurerm_mssql_server" "sql_server_id" {
  depends_on          = [module.mssql_server]
  for_each            = var.mssql_server
  name                = each.value.sql_server_name
  resource_group_name = each.value.RG_name
}

data "azurerm_network_interface" "nic_id" {
  depends_on          = [module.nic]
  for_each            = var.nics
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault" "kv_id" {
  depends_on = [ module.kv, module.RG ]
  for_each = var.kvs
  name = each.value.kv_name
  resource_group_name = each.value.rg_name
}