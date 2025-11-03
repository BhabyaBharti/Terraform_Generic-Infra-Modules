resource "azurerm_bastion_host" "bastion" {
    
    for_each = var.bastion

    name = each.value.bastion_name
    location = each.value.location
    resource_group_name = each.value.rg_name

    ip_configuration {
        name = each.value.ip_configuration.ip_config_name
        subnet_id = each.value.ip_configuration.subnet_id
        public_ip_address_id = each.value.ip_configuration.pip_id
    }

    copy_paste_enabled = each.value.copy_paste_enabled
    file_copy_enabled = each.value.file_copy_enabled
    sku = each.value.sku
    ip_connect_enabled = each.value.ip_connect_enabled
    kerberos_enabled = each.value.kerberos_enabled
    scale_units = each.value.scale_units
    shareable_link_enabled = each.value.shareable_link_enabled
    tunneling_enabled = each.value.tunneling_enabled
    session_recording_enabled = each.value.session_recording_enabled
    virtual_network_id = each.value.virtual_network_id
    tags = {
        environment = each.value.environment
    }
    zones = each.value.zones
}