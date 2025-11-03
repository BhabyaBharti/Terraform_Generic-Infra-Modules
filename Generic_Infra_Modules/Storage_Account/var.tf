variable "Storage_Account" {
  type = map(object(
    {
      stg_name                 = string
      location                 = string
      rg_name                  = string
      account_tier             = string
      account_replication_type = string

      access_tier                   = string
      edge_zone                     = string
      https_traffic_only_enabled    = bool
      min_tls_version               = string

      shared_access_key_enabled     = bool
      public_network_access_enabled = bool
      is_hns_enabled                = bool
      allowed_copy_scope            = string
      dns_endpoint_type             = string

      account_kind                      = string
      provisioned_billing_model_version = string
      allow_nested_items_to_be_public   = string
      default_to_oauth_authentication   = string

      nfsv3_enabled                     = bool
      large_file_share_enabled          = bool
      local_user_enabled                = bool
      infrastructure_encryption_enabled = bool

      sas_policy = object({
        
          expiration_period = string
          expiration_action = string

      })

      custom_domain = object({
          name          = string
          use_subdomain = string
      })

      customer_managed_key = object({

          key_vault_key_id          = string
          managed_hsm_key_id        = string
          user_assigned_identity_id = string

      })

      blob_properties = optional(object({
        
        allowed_headers    = optional(string)
        allowed_methods    = optional(string)
        allowed_origins    = optional(string)
        exposed_headers    = optional(string)
        max_age_in_seconds = optional(string)

        cors_rule = optional(object({
          allowed_headers    = optional(string)
          allowed_methods    = optional(string)
          allowed_origins    = optional(string)
          exposed_headers    = optional(string)
          max_age_in_seconds = optional(string)
        }))

        delete_retention_policy = optional(object({
          days                     = optional(string)
          permanent_delete_enabled = optional(string)
        }))

      }))

      network_rules = object({

            default_action             = string
            bypass                     = string
            ip_rules                   = string
            virtual_network_subnet_ids = string

            private_link_access = list(object({

                endpoint_resource_id = string
                endpoint_tenant_id   = string

            }))
      })
            

      

      owner         = string
      co_owner      = string
      business_unit = string

    }
    ))
}
