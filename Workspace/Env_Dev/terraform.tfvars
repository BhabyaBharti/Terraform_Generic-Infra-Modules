RGs = {
  RG1 = {
    rg_name  = "RG1"
    location = "East US"
    tags = {
      owner    = "Pranju"
      co_owner = "Vishy"
    }
  }
  RG2 = {
    rg_name  = "RG2"
    location = "West US"
    tags = {
      owner = "Bhabya"
    }
  }
}

Storage_Account = {
  STG1 = {
    stg_name                      = "stg1"
    location                      = "East US"
    rg_name                       = "RG1"
    account_tier                  = "Standard"
    account_replication_type      = "LRS"
    access_tier                   = "Hot"
    https_traffic_only_enabled    = true
    min_tls_version               = "TLS1_0"
    shared_access_key_enabled     = true
    public_network_access_enabled = true
    is_hns_enabled                = true
    allowed_copy_scope            = "AAD"
    dns_endpoint_type             = "Standard"

    owner         = "Pranju"
    co_owner      = "GG"
    business_unit = "12"

  }

  STG2 = {
    stg_name                      = "stg2"
    location                      = "East US"
    rg_name                       = "RG2"
    account_tier                  = "Standard"
    account_replication_type      = "LRS"
    access_tier                   = "Hot"
    https_traffic_only_enabled    = true
    min_tls_version               = "TLS1_0"
    shared_access_key_enabled     = true
    public_network_access_enabled = true
    is_hns_enabled                = true
    allowed_copy_scope            = "AAD"
    dns_endpoint_type             = "Standard"

    owner    = "Bhabya"
    co_owner = "Bharti"

  }
}

VNets = {
  vnet1 = {
    vnet_name = "vnet1"
    location  = "East US"
    rg_name   = "RG1"

    address_space                  = ["10.0.0.0/16"]
    edge_zone                      = null
    flow_timeout_in_minutes        = 15
    private_endpoint_vnet_policies = "Disabled"

    owner         = "Vnet1_owner"
    co_owner      = "Vnet1_co_owner"
    business_unit = "Vnet1_business_unit"
    environment   = "Dev1"
  }

  vnet2 = {
    vnet_name = "vnet2"
    location  = "East US"
    rg_name   = "RG2"

    address_space                  = ["10.0.0.1/16"]
    edge_zone                      = null
    flow_timeout_in_minutes        = 20
    private_endpoint_vnet_policies = "Disabled"

    owner         = "Vnet2_owner"
    business_unit = "Vnet2_business_unit"
    environment   = "Dev2"
  }
}

Subnet = {
  Subnet1 = {
    subnet_name = "Subnet1"
    # vnet_name = output.vnet_name.value
    vnet_name = "vnet1"
    rg_name   = "RG1"

    address_prefixes                              = ["10.0.0.0/24"]
    default_outbound_access_enabled               = true
    private_endpoint_network_policies             = "Disabled"
    private_link_service_network_policies_enabled = true
    # sharing_scope                                 = "Tenant"
    service_endpoints = ["Microsoft.Sql"]
  }

  Subnet2 = {
    subnet_name = "Subnet2"
    vnet_name   = "vnet2"
    rg_name     = "RG2"

    address_prefixes                              = ["10.0.0.0/24"]
    default_outbound_access_enabled               = true
    private_endpoint_network_policies             = "Disabled"
    private_link_service_network_policies_enabled = true
    # sharing_scope                                 = "Tenant"
    service_endpoints = ["Microsoft.Sql"]
  }
}

pips = {
  pip1 = {
    pip_name                = "pip1"
    rg_name                 = "RG1"
    location                = "East US"
    allocation_method       = "Static"
    idle_timeout_in_minutes = 10
    sku                     = "Standard"
    sku_tier                = "Regional"
    environment             = "Dev"
  }

  pip2 = {
    pip_name                = "pip2"
    rg_name                 = "RG2"
    location                = "East US"
    allocation_method       = "Static"
    idle_timeout_in_minutes = 10
    sku                     = "Standard"
    sku_tier                = "Regional"
  }
}

nics = {
  nic1 = {
    nic_name = "nic1"
    location = "East US"
    rg_name  = "RG1"

    ip_configuration = {
      subnet_key                    = "Subnet1"
      public_key                    = "pip1"
      ip_config_name                = "ip_config1"
      private_ip_address_allocation = "Static"
    }

    environment = "Staging"
  }

  nic2 = {
    nic_name = "nic2"
    location = "East US"
    rg_name  = "RG2"

    ip_configuration = {
      subnet_key                    = "Subnet2"
      public_key                    = "pip2"
      ip_config_name                = "ip_config2"
      private_ip_address_allocation = "Static"
    }

    environment = "Staging"
  }
}

bastion = {
  bastion1 = {
    bastion_name = "bastion1"
    location     = "East US"
    rg_name      = "RG1"

    ip_configuration = {
      ip_config_name = "ip_config1"
      pip_id         = ""
      subnet_id      = ""
    }
    subnet_key  = "Subnet1"
    public_key  = "pip1"
    sku         = "Standard"
    environment = "UAT"
  }

  bastion2 = {
    bastion_name = "bastion2"
    location     = "East US"
    rg_name      = "RG2"

    ip_configuration = {
      ip_config_name = "ip_config2"
      pip_id         = ""
      subnet_id      = ""
    }
    subnet_key = "Subnet2"
    public_key = "pip2"
    sku        = "Standard"
  }
}

mssql_server = {

  "mssql_1" = {

    sql_server_name              = "mysql1"
    RG_name                      = "RG1"
    location                     = "East US"
    version                      = "12.0"
    administrator_login          = "adminuser"
    administrator_login_password = "SuperSecretPass123!"
    minimum_tls_version          = "1.2"

    public_network_access_enabled        = true
    outbound_network_restriction_enabled = false

    identity = {
      type         = "SystemAssigned"
      identity_ids = []
    }

    tags = {
      owner       = "Vishy"
      environment = "Production"
    }
  }

  "mssql_2" = {

    sql_server_name              = "mysql2"
    RG_name                      = "RG2"
    location                     = "East US"
    version                      = "12.0"
    administrator_login          = "adminuser"
    administrator_login_password = "SuperSecretPass123!"
    minimum_tls_version          = "1.2"

    public_network_access_enabled        = true
    outbound_network_restriction_enabled = false

    identity = {
      type         = "SystemAssigned"
      identity_ids = []
    }

    tags = {
      owner       = "Vishy"
      environment = "Development"
    }
  }
}

mssql_db = {
  "sql_db1" = {
    sql_db_name = "SQL_DB1"
    server_key  = "mssql_1"
    server_id   = ""
  }

  "sql_db2" = {
    sql_db_name = "SQL_DB2"
    server_key  = "mssql_2"
    server_id   = ""
  }
}

vms = {
  vm1 = {
    vm_name  = "vm1"
    location = "East US"
    rg_name  = "RG1"
    vm_size  = "Standard_B2s"
    nic_id   = [""]
    nic_key  = "nic1"

    admin_username = "Bhabya"
    admin_password = "Bhabya@112"

    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
      disk_size_gb         = 30
    }

  }

  vm2 = {
    vm_name  = "vm2"
    location = "East US"
    rg_name  = "RG2"
    vm_size  = "Standard_B2s"
    nic_id   = [""]
    nic_key  = "nic2"

    admin_username = "Bhabya"
    admin_password = "Bhabya@112"

    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
      disk_size_gb         = 30
    }

  }
}

kvs = {
  kv1 = {
    kv_name   = "kv1"
    location  = "East US"
    rg_name   = "RG1"
    tenant_id = "f5031c5a-41d8-4639-bc25-2643f12dc493"
    sku_name  = "standard"
  }

  kv2 = {
    kv_name   = "kv2"
    location  = "East US"
    rg_name   = "RG2"
    tenant_id = "f5031c5a-41d8-4639-bc25-2643f12dc493"
    sku_name  = "standard"
  }
}

kv_secret = {
  secret1 = {
    secret_name  = "secret1"
    key_vault_id = ""
    kv_key       = "kv1"
    secret_value = "Bhabya"
  }

  secret2 = {
    secret_name  = "secret2"
    key_vault_id = ""
    kv_key       = "kv2"
    secret_value = "Bhabya"
  }
}

k8s = {
  cluster1 = {
    k8s_name           = "cluster1"
    location           = "East US"
    rg_name            = "RG1"
    dns_prefix         = "cluster1x"
    kubernetes_version = "1.27"

    default_node_pool = {
      node_pool_name  = "nodepool1"
      node_count      = 2
      vm_size         = "Standard_D2s_v3"
      os_disk_size_gb = 30
      type            = "VirtualMachineScaleSets"
      max_pods        = 30
    }

    network_profile = {
      network_plugin     = "azure"
      service_cidr       = "10.0.0.0/16"
      dns_service_ip     = "10.0.0.10"
      docker_bridge_cidr = "172.17.0.1/16"
    }
  }

  cluster2 = {
    k8s_name           = "cluster2"
    location           = "East US"
    rg_name            = "RG2"
    dns_prefix         = "cluster2x"
    kubernetes_version = "1.27"

    default_node_pool = {
      node_pool_name  = "nodepool2"
      node_count      = 2
      vm_size         = "Standard_D2s_v3"
      os_disk_size_gb = 30
      type            = "VirtualMachineScaleSets"
      max_pods        = 30
    }

    network_profile = {
      network_plugin     = "azure"
      service_cidr       = "10.0.0.0/16"
      dns_service_ip     = "10.0.0.10"
      docker_bridge_cidr = "172.17.0.1/16"
    }
  }
}

ACR = {
  ACR1 = {
    acr_name = "ContainerRegistry1"
    location = "East US"
    rg_name  = "RG1"
    sku      = "Premium"

    tags = {
      Environment = "Production"
    }

  }

  ACR2 = {
    acr_name = "ContainerRegistry2"
    location = "East US"
    rg_name  = "RG2"
    sku      = "Premium"

    tags = {
      Environment = "Development"
    }

  }
}
