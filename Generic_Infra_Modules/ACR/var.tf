variable "ACR" {
    type = map(object(
        {
            acr_name = string
            location = string
            rg_name = string

            sku = string
            admin_enabled = string

            tags = map(string)
            
            georeplications = object({
                location = string
                regional_endpoint_enabled = bool
                zone_redundancy_enabled = bool
                tags = map(string)
            })

            network_rule_set = object({
                default_action = string
                ip_rule = object({
                    action = string
                    ip_range = string
                })
            })

            public_network_access_enabled = bool
            quarantine_policy_enabled = bool
            retention_policy_in_days = number
            trust_policy_enabled = bool

            zone_redundancy_enabled = bool

            export_policy_enabled = bool
            anonymous_pull_enabled = bool
            data_endpoint_enabled = bool
            network_rule_bypass_option = string

        
            identity = object({
                type = string
                identity_ids = list(string)
            })

            encryption = object({
                key_vault_key_id = string
                identity_client_id = string
            })
        }
    ))
  
}