variable "RGs" {
  type = map(object(
    {
      rg_name  = string
      location = string
      tags     = optional(map(string))
      # owner=optional(string, "")
      # co_owner=optional(string, "")
    }
  ))
}

variable "Storage_Account" {
  type = map(object(
    {
      stg_name                 = string
      location                 = string
      rg_name                  = string
      account_tier             = string
      account_replication_type = string

      access_tier                   = optional(string)
      edge_zone                     = optional(string)
      https_traffic_only_enabled    = optional(bool)
      min_tls_version               = optional(string)

      shared_access_key_enabled     = optional(bool)
      public_network_access_enabled = optional(bool)
      is_hns_enabled                = optional(bool)
      allowed_copy_scope            = optional(string)
      dns_endpoint_type             = optional(string)

      account_kind                      = optional(string)
      provisioned_billing_model_version = optional(string)
      allow_nested_items_to_be_public   = optional(string)
      default_to_oauth_authentication   = optional(string)

      nfsv3_enabled                     = optional(bool)
      large_file_share_enabled          = optional(bool)
      local_user_enabled                = optional(bool)
      infrastructure_encryption_enabled = optional(bool)

      sas_policy = optional(object({
        
          expiration_period = optional(string)
          expiration_action = optional(string)

      }))

      custom_domain = optional(object({
          name          = optional(string)
          use_subdomain = optional(string)
      }))

      customer_managed_key = optional(object({

          key_vault_key_id          = optional(string)
          managed_hsm_key_id        = optional(string)
          user_assigned_identity_id = optional(string)

      }))

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

      network_rules = optional(object({

        default_action             = optional(string)
        bypass                     = optional(string)
        ip_rules                   = optional(string)
        virtual_network_subnet_ids = optional(string)

        private_link_access = optional(list(object({

            endpoint_resource_id = optional(string)
            endpoint_tenant_id   = optional(string)

        })))
      }))

      owner         = optional(string)
      co_owner      = optional(string)
      business_unit = optional(string)

    }
    ))
}


variable "VNets" {
  type = map(object(
    {
      vnet_name = string
      location  = string
      rg_name   = string

      address_space                  = optional(list(string))
      edge_zone                      = optional(string)
      flow_timeout_in_minutes        = optional(number)
      private_endpoint_vnet_policies = optional(string)

      owner         = optional(string, "Parent_var_owner")
      co_owner      = optional(string)
      business_unit = optional(string)
      environment   = optional(string)
    }
    )
  )
}

variable "Subnet" {
  type = map(object(
    {
      subnet_name = string
      vnet_name   = string
      rg_name     = string

      address_prefixes                              = optional(list(string))
      default_outbound_access_enabled               = optional(bool)
      private_endpoint_network_policies             = optional(string)
      private_link_service_network_policies_enabled = optional(bool)
      sharing_scope                                 = optional(string)
      service_endpoints                             = optional(list(string))
      service_endpoint_policy_ids                   = optional(list(string))
    }
  ))
}

variable "pips" {
  type = map(object(
    {
      pip_name          = string
      rg_name           = string
      location          = string
      allocation_method = string

      zones                   = optional(set(string))
      ddos_protection_mode    = optional(string)
      ddos_protection_plan_id = optional(string)
      domain_name_label       = optional(string)
      domain_name_label_scope = optional(string)
      edge_zone               = optional(string)
      idle_timeout_in_minutes = optional(number)
      ip_tags                 = optional(map(string))
      ip_version              = optional(number)
      public_ip_prefix_id     = optional(string)
      reverse_fqdn            = optional(string)
      sku                     = optional(string)
      sku_tier                = optional(string)
      environment             = optional(string)
    }
  ))
}

variable "nics" {
  type = map(object(
    {
      nic_name = string
      location = string
      rg_name  = string

      ip_configuration = object({
        ip_config_name                = string
        subnet_id                     = optional(string)
        private_ip_address_allocation = string

        gateway_load_balancer_frontend_ip_configuration_id = optional(string)
        private_ip_address_version                         = optional(number)
        public_ip_address_id                               = optional(string)
        primary                                            = optional(bool)
        private_ip_address                                 = optional(string)
        subnet_key                                         = optional(string)
        public_key                                         = optional(string)
      })


      auxiliary_mode                 = optional(string)
      auxiliary_sku                  = optional(string)
      dns_servers                    = optional(list(string))
      edge_zone                      = optional(string)
      ip_forwarding_enabled          = optional(bool)
      accelerated_networking_enabled = optional(bool)
      internal_dns_name_label        = optional(string)
      environment                    = optional(string)

    }
  ))

}

variable "bastion" {
  type = map(object(
    {
      bastion_name = string
      location     = string
      rg_name      = string

      ip_configuration = optional(object({
        ip_config_name = string
        subnet_id      = string
        pip_id         = string
        })
      )

      subnet_key                = optional(string)
      public_key                = optional(string)
      copy_paste_enabled        = optional(bool)
      file_copy_enabled         = optional(bool)
      sku                       = optional(string)
      ip_connect_enabled        = optional(bool)
      kerberos_enabled          = optional(bool)
      scale_units               = optional(number)
      shareable_link_enabled    = optional(bool)
      tunneling_enabled         = optional(bool)
      session_recording_enabled = optional(bool)
      virtual_network_id        = optional(string)
      environment               = optional(string)
      zones                     = optional(list(string))
    }
  ))
}

variable "mssql_server" {
  type = map(object({
    sql_server_name              = string
    location                     = string
    RG_name                      = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string

    connection_policy                    = optional(string)
    public_network_access_enabled        = optional(bool)
    outbound_network_restriction_enabled = optional(bool)

    azuread_administrator = optional(object({
      login_username = optional(string)
      object_id      = optional(string)
      tenant_id      = optional(string)
    }))

    identity = optional(object({
      type         = optional(string)
      identity_ids = optional(list(string))
    }))

    tags = optional(map(string))

  }))
}

variable "mssql_db" {
  type = map(object({

    sql_db_name = string
    server_id   = string

    collation    = optional(string)
    license_type = optional(string)
    max_size_gb  = optional(string)
    sku_name     = optional(string)
    enclave_type = optional(string)

    auto_pause_delay_in_minutes = optional(number)
    create_mode                 = optional(string)

    import = optional(object({

      storage_uri                  = optional(string)
      storage_key                  = optional(string)
      storage_key_type             = optional(string)
      administrator_login          = optional(string)
      administrator_login_password = optional(string)
      authentication_type          = optional(string)
      storage_account_id           = optional(string)
    }))

    creation_source_database_id    = optional(string)
    elastic_pool_id                = optional(string)
    geo_backup_enabled             = optional(string)
    maintenance_configuration_name = optional(string)
    ledger_enabled                 = optional(string)

    long_term_retention_policy = optional(object({

      weekly_retention  = optional(string)
      monthly_retention = optional(string)
      yearly_retention  = optional(string)
      week_of_year      = optional(string)

    }))

    min_capacity                          = optional(string)
    restore_point_in_time                 = optional(string)
    recovery_point_id                     = optional(string)
    restore_dropped_database_id           = optional(string)
    restore_long_term_retention_backup_id = optional(string)
    read_replica_count                    = optional(string)
    read_scale                            = optional(string)
    sample_name                           = optional(string)

    short_term_retention_policy = optional(object({

      retention_days           = optional(number)
      backup_interval_in_hours = optional(number)

    }))

    threat_detection_policy = optional(object({

      state                      = optional(string)
      disabled_alerts            = optional(string)
      email_account_admins       = optional(string)
      email_addresses            = optional(string)
      retention_days             = optional(number)
      storage_account_access_key = optional(string)
      storage_endpoint           = optional(string)

    }))

    transparent_data_encryption_enabled                        = optional(bool)
    transparent_data_encryption_key_automatic_rotation_enabled = optional(bool)
    transparent_data_encryption_key_vault_key_id               = optional(string)
    zone_redundant                                             = optional(string)
    secondary_type                                             = optional(string)
    server_key                                                 = optional(string)

    tags = optional(map(string))

  }))
}

variable "vms" {
  type = map(object(
    {
      vm_name  = string
      location = string
      rg_name  = string
      nic_id   = list(string)
      vm_size  = string

      license_type               = optional(string)
      admin_username             = optional(string)
      admin_password             = optional(string)
      allow_extension_operations = optional(string)
      availability_set_id        = optional(string)

      nic_key = optional(string)

      capacity_reservation_group_id = optional(string)
      computer_name                 = optional(string)
      secure_boot_enabled           = optional(bool)
      
      user_data                     = optional(string)
      vtpm_enabled                  = optional(bool)
      virtual_machine_scale_set_id  = optional(string)
      zone                          = optional(string)

      source_image_reference = optional(object({
        publisher = optional(string)
        offer     = optional(string)
        sku       = optional(string)
        version   = optional(string)
      }))

      os_disk = object({
        os_disk_name      = optional(string)
        caching           = string
        disk_size_gb = optional(string)
        storage_account_type = optional(string)
      })

      boot_diagnostics = optional(object({
        storage_account_uri = optional(string)
      }))


      disable_password_authentication = optional(bool)


      admin_ssh_key = optional(object({
        username   = optional(string)
        public_key = optional(string)
      }))

      plan = optional(object({
        product   = optional(string)
        publisher = optional(string)
        name      = optional(string)
      }))

      delete_os_disk_on_termination    = optional(bool)
      delete_data_disks_on_termination = optional(bool)
      primary_network_interface_id     = optional(string)
      proximity_placement_group_id     = optional(string)

      reboot_setting                                         = optional(string)
      priority                                               = optional(string)
      provision_vm_agent                                     = optional(bool)
      platform_fault_domain                                  = optional(string)
      patch_mode                                             = optional(string)
      max_bid_price                                          = optional(string)
      patch_assessment_mode                                  = optional(string)
      custom_data                                            = optional(string)
      dedicated_host_id                                      = optional(string)
      dedicated_host_group_id                                = optional(string)
      disk_controller_type                                   = optional(string)
      bypass_platform_safety_checks_on_user_schedule_enabled = optional(bool)
      edge_zone                                              = optional(string)
      encryption_at_host_enabled                             = optional(bool)
      eviction_policy                                        = optional(string)
      extensions_time_budget                                 = optional(string)

      tags = optional(map(string))
    }
  ))
}

variable "kvs" {
  type = map(object(
    {
      kv_name   = string
      location  = string
      rg_name   = string
      tenant_id = string
      sku_name  = string

      access_policy = optional(object({
        tenant_id               = optional(string)
        object_id               = optional(string)
        application_id          = optional(string)
        certificate_permissions = optional(string)
        key_permissions         = optional(string)
      }))

      soft_delete_retention_days  = optional(number)
      purge_protection_enabled    = optional(bool)
      enabled_for_disk_encryption = optional(bool)

      enabled_for_deployment          = optional(bool)
      enabled_for_template_deployment = optional(bool)
      rbac_authorization_enabled      = optional(bool)
      public_network_access_enabled   = optional(bool)

      environment = optional(string)

    }
  ))
}

variable "kv_secret" {
  type = map(object(
    {
      secret_name  = string
      secret_value = string
      key_vault_id = string

      content_type     = optional(string)
      tags             = optional(map(string))

      not_before_date  = optional(bool)
      expiration_date  = optional(number)
      kv_key           = optional(string)
    }
  ))
}

variable "k8s" {
    type = map(object(
        {
            k8s_name = string
            location = string
            rg_name = string
            dns_prefix = string

            default_node_pool = object({
                node_pool_name = string
                node_count = optional(number)
                vm_size = string
                availability_zones = optional(string)
                enable_auto_scaling = optional(string)
                enable_node_public_ip = optional(string)
                max_pods = optional(string)
                node_labels = optional(string)
                node_taints = optional(string)
                os_disk_size_gb = optional(string)
                type = optional(string)
                tags = optional(map(string))
                vnet_subnet_id = optional(string)
            })

            oms_agent = optional(object({
              log_analytics_workspace_id = optional(string)
            }))

            auto_scaler_profile = optional(object({
                balance_similar_node_groups   = optional(string)
                max_graceful_termination_sec  = optional(string)
                scale_down_delay_after_add    = optional(string)
                scale_down_delay_after_delete = optional(string)

                scale_down_delay_after_failure = optional(string)

                scan_interval                    = optional(string)
                scale_down_unneeded              = optional(string)
                scale_down_unready               = optional(string)
                scale_down_utilization_threshold = optional(string)
            }))

            windows_profile = optional(object({
                admin_username = optional(string)
                admin_password = optional(string)
            }))

            linux_profile = optional(object({
                admin_username = optional(string)
                ssh_key = optional(object({
                    key_data = optional(string)
                }))
            }))

            network_profile = optional(object({
                network_plugin = optional(string)
                network_policy = optional(string)
                dns_service_ip = optional(string)

                outbound_type = optional(string)

                pod_cidr = optional(string)
                service_cidr = optional(string)
                load_balancer_sku = optional(string)

                load_balancer_profile = optional(object({
                    outbound_ports_allocated = optional(string)
                    idle_timeout_in_minutes = optional(string)
                    managed_outbound_ip_count = optional(string)
                    outbound_ip_address_ids = optional(string)
                    outbound_ip_prefix_ids = optional(string)
                }))
            }))

            identity = optional(object({
                type = optional(string)
            }))

            role_based_access_control = optional(object({
                azure_active_directory = optional(object({
                    managed = optional(string)
                    tenant_id = optional(string)
                }))
                enabled = optional(string)
            }))

            service_principal = optional(object({
                client_id = optional(string)
                client_secret = optional(string)
            }))

            dns_prefix_private_cluster = optional(string)
            automatic_upgrade_channel = optional(string)
            azure_policy_enabled = optional(bool)
            cost_analysis_enabled = optional(bool)

            custom_ca_trust_certificates_base64 = optional(list(string))
            disk_encryption_set_id = optional(string)
            edge_zone = optional(string)
            http_application_routing_enabled = optional(bool)

            image_cleaner_enabled = optional(bool)
            image_cleaner_interval_hours = optional(number)
            kubernetes_version = optional(number)
            local_account_disabled = optional(bool)

            node_os_upgrade_channel = optional(string)
            node_resource_group = optional(string)
            oidc_issuer_enabled = optional(bool)
            open_service_mesh_enabled = optional(bool)

            private_cluster_enabled = optional(bool)
            private_dns_zone_id = optional(string)
            private_cluster_public_fqdn_enabled = optional(bool)
            workload_identity_enabled = optional(bool)

            role_based_access_control_enabled = optional(bool)
            run_command_enabled = optional(bool)
            sku_tier = optional(string)
            support_plan = optional(string)

            azure_active_directory_role_based_access_control = optional(object({
                tenant_id = optional(string)
                admin_group_object_ids = optional(string)
            }))
            
            tags = optional(map(string))
        }
    ))
}


variable "ACR" {
    type = map(object(
        {
            acr_name = string
            location = string
            rg_name = string
            sku = string

            admin_enabled = optional(string)
            tags = optional(map(string))
            
            georeplications = optional(object({
                location = optional(string)
                regional_endpoint_enabled = optional(bool)
                zone_redundancy_enabled = optional(bool)
                tags = optional(map(string))
            }))

            network_rule_set = optional(object({
                default_action = optional(string)
                ip_rule = optional(object({
                    action = optional(string)
                    ip_range = optional(string)
                }))
            }))

            public_network_access_enabled = optional(bool)
            quarantine_policy_enabled = optional(bool)
            retention_policy_in_days = optional(number)
            trust_policy_enabled = optional(bool)

            zone_redundancy_enabled = optional(bool)

            export_policy_enabled = optional(bool)
            anonymous_pull_enabled = optional(bool)
            data_endpoint_enabled = optional(bool)
            network_rule_bypass_option = optional(string)

        
            identity = optional(object({
                type = optional(string)
                identity_ids = optional(list(string))
            }))

            encryption = optional(object({
                key_vault_key_id = optional(string)
                identity_client_id = optional(string)
            }))
        }
    ))
}