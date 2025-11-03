resource "azurerm_storage_account" "stg_acct" {
  for_each = var.Storage_Account

  name                     = each.value.stg_name
  location                 = each.value.location
  resource_group_name      = each.value.rg_name
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  access_tier                       = each.value.access_tier
  edge_zone                         = each.value.edge_zone
  https_traffic_only_enabled        = each.value.https_traffic_only_enabled
  min_tls_version                   = each.value.min_tls_version

  shared_access_key_enabled         = each.value.shared_access_key_enabled
  public_network_access_enabled     = each.value.public_network_access_enabled
  is_hns_enabled                    = each.value.is_hns_enabled
  allowed_copy_scope                = each.value.allowed_copy_scope
  dns_endpoint_type                 = each.value.dns_endpoint_type

  account_kind                      = each.value.account_kind
  provisioned_billing_model_version = each.value.provisioned_billing_model_version
  allow_nested_items_to_be_public   = each.value.allow_nested_items_to_be_public
  default_to_oauth_authentication   = each.value.default_to_oauth_authentication

  nfsv3_enabled                     = each.value.nfsv3_enabled
  large_file_share_enabled          = each.value.large_file_share_enabled
  local_user_enabled                = each.value.local_user_enabled
  infrastructure_encryption_enabled = each.value.infrastructure_encryption_enabled

  dynamic "sas_policy" {
    for_each = each.value.sas_policy != null ? [each.value.sas_policy] : []
    content {
      expiration_period = sas_policy.value.expiration_period
      expiration_action = sas_policy.value.expiration_action
    }
  }

  dynamic "custom_domain" {
    for_each = each.value.custom_domain != null ? [each.value.custom_domain] : []
    content {
      name          = custom_domain.value.name
      use_subdomain = custom_domain.value.use_subdomain
    }
  }

  dynamic "customer_managed_key" {
    for_each = each.value.customer_managed_key != null ? [each.value.customer_managed_key] : []
    content {
      key_vault_key_id          = customer_managed_key.value.key_vault_key_id
      managed_hsm_key_id        = customer_managed_key.value.managed_hsm_key_id
      user_assigned_identity_id = customer_managed_key.value.user_assigned_identity_id
    }
  }

  dynamic "blob_properties" {
    for_each = each.value.blob_properties != null ? [each.value.blob_properties] : []
    content {
      dynamic "cors_rule" {
        for_each = blob_properties.value.cors_rule != null ? [blob_properties.value.cors_rule] : []
        content {
          allowed_headers    = cors_rule.value.allowed_headers
          allowed_methods    = cors_rule.value.allowed_methods
          allowed_origins    = cors_rule.value.allowed_origins
          exposed_headers    = cors_rule.value.exposed_headers
          max_age_in_seconds = cors_rule.value.max_age_in_seconds
        }
      }
      dynamic "delete_retention_policy" {
        for_each = blob_properties.value.delete_retention_policy != null ? [blob_properties.value.delete_retention_policy] : []
        content {
          days                     = delete_retention_policy.value.days
          permanent_delete_enabled = delete_retention_policy.value.permanent_delete_enabled
        }
      }
    }
  }

    dynamic "network_rules" {
      for_each = each.value.network_rules != null ? [each.value.network_rules] : []
      content {
        default_action             = network_rules.value.default_action
        bypass                     = network_rules.value.bypass
        ip_rules                   = network_rules.value.ip_rules
        virtual_network_subnet_ids = network_rules.value.virtual_network_subnet_ids

        dynamic "private_link_access" {
          for_each = network_rules.value.private_link_access != null ? [network_rules.value.private_link_access] : []
          content {
            endpoint_resource_id = private_link_access.value.endpoint_resource_id
            endpoint_tenant_id   = private_link_access.value.endpoint_tenant_id
          }
        }
      }
    }

  
  tags = {
    owner         = each.value.owner
    co_owner      = each.value.co_owner
    business_unit = each.value.business_unit
  }

}
