resource "azurerm_container_registry" "ACR" {
    for_each = var.ACR

    name = each.value.acr_name
    location = each.value.location
    resource_group_name = each.value.rg_name
    
    sku = each.value.sku
    admin_enabled = each.value.admin_enabled

    tags = each.value.tags

    dynamic "georeplications" {
      for_each = each.value.georeplications != null ? [each.value.georeplications] : []
      content {
        location = georeplications.value.location
        regional_endpoint_enabled = georeplications.value.regional_endpoint_enabled
        zone_redundancy_enabled = georeplications.value.zone_redundancy_enabled
        tags = georeplications.value.tags
      }
    }

    dynamic "network_rule_set" {
      for_each = each.value.network_rule_set != null ? [each.value.network_rule_set] : []
      content {
        default_action = network_rule_set.value.default_action
        dynamic "ip_rule" {
            for_each = network_rule_set.value.ip_rule != null ? [network_rule_set.value.ip_rule] : []
            content {
                action = ip_rule.value.action
                ip_range = ip_rule.value.ip_range
            }
        }
      }
    }

    public_network_access_enabled = each.value.public_network_access_enabled
    quarantine_policy_enabled = each.value.quarantine_policy_enabled
    retention_policy_in_days = each.value.retention_policy_in_days
    trust_policy_enabled = each.value.trust_policy_enabled

    zone_redundancy_enabled = each.value.zone_redundancy_enabled

    export_policy_enabled = each.value.export_policy_enabled
    anonymous_pull_enabled = each.value.anonymous_pull_enabled
    data_endpoint_enabled = each.value.data_endpoint_enabled
    network_rule_bypass_option = each.value.network_rule_bypass_option

    dynamic "identity" {
        for_each = each.value.identity != null ? [each.value.identity] : []
        content {
            type = identity.value.type
            identity_ids = identity.value.identity_ids
        }
      
    }

    dynamic "encryption" {
      for_each = each.value.encryption != null ? [each.value.encryption] : []
      content {
        key_vault_key_id = encryption.value.key_vault_key_id
        identity_client_id = encryption.value.identity_client_id

      }
    }
  
}