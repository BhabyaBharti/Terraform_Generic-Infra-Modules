resource "azurerm_kubernetes_cluster" "k8s" {

  for_each = var.k8s

  name                = each.value.k8s_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  dns_prefix          = each.value.dns_prefix

  dynamic "default_node_pool" {
    for_each = each.value.default_node_pool != null ? [each.value.default_node_pool] : []
    content {
      name       = default_node_pool.value.node_pool_name
      node_count = default_node_pool.value.node_count
      vm_size    = default_node_pool.value.vm_size
    }
  }

  azure_policy_enabled             = each.value.azure_policy_enabled
  http_application_routing_enabled = each.value.http_application_routing_enabled
  open_service_mesh_enabled        = each.value.open_service_mesh_enabled

  dynamic "auto_scaler_profile" {
    for_each = each.value.auto_scaler_profile != null ? [each.value.auto_scaler_profile] : []
    content {
      balance_similar_node_groups   = auto_scaler_profile.value.balance_similar_node_groups
      max_graceful_termination_sec  = auto_scaler_profile.value.max_graceful_termination_sec
      scale_down_delay_after_add    = auto_scaler_profile.value.scale_down_delay_after_add
      scale_down_delay_after_delete = auto_scaler_profile.value.scale_down_delay_after_delete

      scale_down_delay_after_failure = auto_scaler_profile.value.scale_down_delay_after_failure

      scan_interval                    = auto_scaler_profile.value.scan_interval
      scale_down_unneeded              = auto_scaler_profile.value.scale_down_unneeded
      scale_down_unready               = auto_scaler_profile.value.scale_down_unready
      scale_down_utilization_threshold = auto_scaler_profile.value.scale_down_utilization_threshold
    }
  }

  dynamic "windows_profile" {
    for_each = each.value.windows_profile != null ? [each.value.windows_profile] : []
    content {
      admin_username = windows_profile.value.admin_username
      admin_password = windows_profile.value.admin_password
    }
  }


  dynamic "linux_profile" {
    for_each = each.value.linux_profile != null ? [each.value.linux_profile] : []
    content {
      admin_username = linux_profile.value.admin_username
      dynamic "ssh_key" {
        for_each = linux_profile.value.ssh_key != null ? [linux_profile.value.ssh_key] : []
        content {
          key_data = ssh_key.value.key_data
        }
      }
    }
  }

  dynamic "network_profile" {
    for_each = each.value.network_profile != null ? [each.value.network_profile] : []
    content {
      network_plugin = network_profile.value.network_plugin
      network_policy = network_profile.value.network_policy
      dns_service_ip = network_profile.value.dns_service_ip

      outbound_type = network_profile.value.outbound_type

      pod_cidr          = network_profile.value.pod_cidr
      service_cidr      = network_profile.value.service_cidr
      load_balancer_sku = network_profile.value.load_balancer_sku

      dynamic "load_balancer_profile" {
        for_each = network_profile.value.load_balancer_profile != null ? [network_profile.value.load_balancer_profile] : []
        content {
          outbound_ports_allocated = load_balancer_profile.value.outbound_ports_allocated
          idle_timeout_in_minutes  = load_balancer_profile.value.idle_timeout_in_minutes

          managed_outbound_ip_count = load_balancer_profile.value.managed_outbound_ip_count

          outbound_ip_address_ids = load_balancer_profile.value.outbound_ip_address_ids
          outbound_ip_prefix_ids  = load_balancer_profile.value.outbound_ip_prefix_ids
        }

      }
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      type = identity.value.type
    }
  }

  role_based_access_control_enabled = each.value.role_based_access_control_enabled

  dynamic "service_principal" {
    for_each = each.value.service_principal != null ? [each.value.service_principal] : []
    content {
      client_id     = service_principal.value.client_id
      client_secret = service_principal.value.client_secret
    }
  }

  dynamic "oms_agent" {
    for_each = each.value.oms_agent != null ? [each.value.oms_agent] : []
    content {
      log_analytics_workspace_id = oms_agent.value.log_analytics_workspace_id
    }
  }

  dns_prefix_private_cluster = each.value.dns_prefix_private_cluster
  automatic_upgrade_channel  = each.value.automatic_upgrade_channel
  cost_analysis_enabled      = each.value.cost_analysis_enabled

  custom_ca_trust_certificates_base64 = each.value.custom_ca_trust_certificates_base64
  disk_encryption_set_id              = each.value.disk_encryption_set_id
  edge_zone                           = each.value.edge_zone

  image_cleaner_enabled        = each.value.image_cleaner_enabled
  image_cleaner_interval_hours = each.value.image_cleaner_interval_hours
  kubernetes_version           = each.value.kubernetes_version
  local_account_disabled       = each.value.local_account_disabled

  node_os_upgrade_channel   = each.value.node_os_upgrade_channel
  node_resource_group       = each.value.node_resource_group
  oidc_issuer_enabled       = each.value.oidc_issuer_enabled

  private_cluster_enabled             = each.value.private_cluster_enabled
  private_dns_zone_id                 = each.value.private_dns_zone_id
  private_cluster_public_fqdn_enabled = each.value.private_cluster_public_fqdn_enabled
  workload_identity_enabled           = each.value.workload_identity_enabled

  run_command_enabled               = each.value.run_command_enabled
  sku_tier                          = each.value.sku_tier
  support_plan                      = each.value.support_plan

  dynamic "azure_active_directory_role_based_access_control" {
    for_each = each.value.azure_active_directory_role_based_access_control != null ? [each.value.azure_active_directory_role_based_access_control] : []
    content {
      tenant_id          = azure_active_directory_role_based_access_control.value.tenant_id
      admin_group_object_ids = try(azure_active_directory_role_based_access_control.value.admin_group_object_ids, null)
    }
  }

  identity {
    type = try(each.value.identity.type, "SystemAssigned")
  }

  tags = each.value.tags

}
