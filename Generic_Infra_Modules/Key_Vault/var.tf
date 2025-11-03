variable "kvs" {
    type = map(object(
        {
            kv_name = string
            location = string
            rg_name = string
            tenant_id = string
            sku_name = string
            
            access_policy = object({
                tenant_id = string
                object_id = string
                application_id = string
                certificate_permissions = string
                key_permissions = string
            })
            
            soft_delete_retention_days = number
            purge_protection_enabled = bool
            enabled_for_disk_encryption = bool

            enabled_for_deployment = bool
            enabled_for_template_deployment = bool
            rbac_authorization_enabled = bool
            public_network_access_enabled = bool
            
            environment = string
            
        }
    ))
}