module "RG" {
  source   = "../../Generic_Infra_Modules/Resource_Group"
  for_each = var.RGs

  rg_name  = each.key
  location = each.value.location
  tags     = each.value.tags
}

module "Storage_Acct" {

  depends_on = [module.RG]
  source     = "../../Generic_Infra_Modules/Storage_Account"

  Storage_Account = var.Storage_Account
}

module "VNet" {

  depends_on = [module.RG]
  source     = "../../Generic_Infra_Modules/Virtual_Network"

  VNet = var.VNets
}

module "Subnet" {

  depends_on = [module.VNet, module.RG]
  source     = "../../Generic_Infra_Modules/Subnet"

  Subnet = var.Subnet
}

module "Public_IP" {

  depends_on = [module.RG]
  source     = "../../Generic_Infra_Modules/Public_IP"

  pips = var.pips
}

output "Public_IP" {
  value = "Hello Pranju"
}


# # locals {
# #   nics = {
# #     for key, nic in var.nics : key => {
# #       nic_name            = "nic1"
# #       location            = "East US"
# #       resource_group_name = "RG1"

# #       ip_config_name = "ip_config1"
# #       subnet_id      = data.azurerm_subnet.subnet_id.
# #       pip_allocation = "Static"

# #       environment = "Staging"
# #     }
# #   }
# # }

module "nic" {

  depends_on = [module.RG, module.Subnet]
  source     = "../../Generic_Infra_Modules/NIC"

  for_each = local.nics

  nics = {
    (each.key) = each.value
  }

}

locals {

  nics = { for key, value in var.nics : key => merge(value, {

    ip_configuration = {
      ip_config_name                = value.ip_configuration.ip_config_name
      subnet_id                     = data.azurerm_subnet.subnet_id[value.ip_configuration.subnet_key].id
      pip_id                        = data.azurerm_public_ip.pip_id[value.ip_configuration.public_key].id
      private_ip_address_allocation = value.ip_configuration.private_ip_address_allocation
    }
  }) }
}

# output "vnet_name" {
#   value = module.VNet.vnet_name
# }

module "bastion" {

  depends_on = [module.RG, module.VNet]
  source     = "../../Generic_Infra_Modules/Azure_Bastion"

  for_each = local.bastion

  bastion = {
    (each.key) = each.value
  }

}

locals {

  bastion = { for key, value in var.bastion : key => merge(value, {

    ip_configuration = {
      ip_config_name = value.ip_configuration.ip_config_name
      subnet_id      = data.azurerm_subnet.subnet_id[value.subnet_key].id
      pip_id         = data.azurerm_public_ip.pip_id[value.public_key].id
    } })
  }
}

module "mssql_server" {

  depends_on = [module.RG]
  source     = "../../Generic_Infra_Modules/SQL_Server"

  mssql_server = var.mssql_server
}

module "mssql_db" {

  depends_on = [module.mssql_server]
  source     = "../../Generic_Infra_Modules/SQL_DB"

  for_each = local.mssql_db

  mssql_db = {
    (each.key) = each.value
  }
}

locals {
  mssql_db = { for key, value in var.mssql_db : key => merge(value, {
    server_id = data.azurerm_mssql_server.sql_server_id[value.server_key].id
  }) }
}

module "vms" {

  depends_on = [module.nic, module.Subnet]
  source     = "../../Generic_Infra_Modules/Linux_Virtual_Machine"

  for_each = local.vms

  vms = {
    (each.key) = each.value
  }
}

locals {
  vms = { for key, value in var.vms : key => merge(value, {
    nic_id = [data.azurerm_network_interface.nic_id[value.nic_key].id]
  }) }
}

module "kv" {

  depends_on = [module.RG]
  source = "../../Generic_Infra_Modules/Key_Vault"

  kvs = var.kvs

}

module "kv_secret" {

  depends_on = [ module.kv ]
  source = "../../Generic_Infra_Modules/Key_Vault_Secret"

  for_each = local.kv_secret

  kv_secret = {
    (each.key) = each.value
  }

}

locals {
  kv_secret = {for key, value in var.kv_secret : key => merge(value, {
    key_vault_id = data.azurerm_key_vault.kv_id[value.kv_key].id
  })}
}

module "k8s_cluster" {
  depends_on = [ module.RG ]
  source = "../../Generic_Infra_Modules/AKS"

  k8s = var.k8s
}

module "ACR" {
  depends_on = [ module.RG ]
  source = "../../Generic_Infra_Modules/ACR"

  ACR = var.ACR
  
}