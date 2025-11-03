resource "azurerm_key_vault" "kv" {

    for_each = var.kvs

    name = each.value.kv_name
    location = each.value.location
    resource_group_name = each.value.rg_name
    tenant_id = each.value.tenant_id
    sku_name = each.value.sku_name

    dynamic "access_policy" {
        for_each = each.value.access_policy != null ? [each.value.access_policy] : []
        content {
            tenant_id = access_policy.value.tenant_id
            object_id = access_policy.value.object_id
            application_id = access_policy.value.application_id
            certificate_permissions = access_policy.value.certificate_permissions
            key_permissions = access_policy.value.key_permissions
        }
        
    }
    
    soft_delete_retention_days = each.value.soft_delete_retention_days
    purge_protection_enabled = each.value.purge_protection_enabled
    enabled_for_disk_encryption = each.value.enabled_for_disk_encryption

    enabled_for_deployment = each.value.enabled_for_deployment
    enabled_for_template_deployment = each.value.enabled_for_template_deployment
    rbac_authorization_enabled = each.value.rbac_authorization_enabled
    public_network_access_enabled = each.value.public_network_access_enabled

    tags = {
        environment = each.value.environment
    }

}