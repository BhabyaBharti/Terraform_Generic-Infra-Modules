variable "k8s" {
    type = map(object(
        {
            k8s_name = string
            location = string
            rg_name = string
            dns_prefix = string

            default_node_pool = object({
                node_pool_name = string
                node_count = number
                vm_size = string
                availability_zones = string
                enable_auto_scaling = string
                enable_node_public_ip = string
                max_pods = string
                node_labels = string
                node_taints = string
                os_disk_size_gb = string
                type = string
                tags = map(string)
                vnet_subnet_id = string
            })

            auto_scaler_profile = object({
                balance_similar_node_groups   = string
                max_graceful_termination_sec  = string
                scale_down_delay_after_add    = string
                scale_down_delay_after_delete = string

                scale_down_delay_after_failure = string

                scan_interval                    = string
                scale_down_unneeded              = string
                scale_down_unready               = string
                scale_down_utilization_threshold = string
            })

            windows_profile = object({
                admin_username = string
                admin_password = string
            })

            linux_profile = object({
                admin_username = string
                ssh_key = object({
                    key_data = string
                })
            })

            network_profile = object({
                network_plugin = string
                network_policy = string
                dns_service_ip = string

                outbound_type = string

                pod_cidr = string
                service_cidr = string
                load_balancer_sku = string

                load_balancer_profile = object({
                    outbound_ports_allocated = string
                    idle_timeout_in_minutes = string
                    managed_outbound_ip_count = string
                    outbound_ip_address_ids = string
                    outbound_ip_prefix_ids = string
                })
            })

            identity = object({
                type = string
            })

            azure_active_directory_role_based_access_control = object({
                tenant_id = string
                admin_group_object_ids = string
            })

            service_principal = object({
                client_id = string
                client_secret = string
            })

            oms_agent = object({
              log_analytics_workspace_id = string
            })

            dns_prefix_private_cluster = string
            automatic_upgrade_channel = string
            azure_policy_enabled = bool
            cost_analysis_enabled = bool

            custom_ca_trust_certificates_base64 = list(string)
            disk_encryption_set_id = string
            edge_zone = string
            http_application_routing_enabled = bool

            image_cleaner_enabled = bool
            image_cleaner_interval_hours = number
            kubernetes_version = number
            local_account_disabled = bool

            node_os_upgrade_channel = string
            node_resource_group = string
            oidc_issuer_enabled = bool
            open_service_mesh_enabled = bool

            private_cluster_enabled = bool
            private_dns_zone_id = string
            private_cluster_public_fqdn_enabled = bool
            workload_identity_enabled = bool

            role_based_access_control_enabled = bool
            run_command_enabled = bool
            sku_tier = string
            support_plan = string
            
            tags = map(string)
        }
    ))
}