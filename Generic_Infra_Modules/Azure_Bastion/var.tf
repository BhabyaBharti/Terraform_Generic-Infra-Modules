variable "bastion" {
    type = map(object(
        {
            bastion_name = string
            location = string
            rg_name = string
        
            ip_configuration = object({
                ip_config_name = string
                subnet_id = string
                pip_id = string
            })
            
            copy_paste_enabled = bool
            file_copy_enabled = bool
            sku = string
            ip_connect_enabled = bool
            kerberos_enabled = bool
            scale_units = number
            shareable_link_enabled = bool
            tunneling_enabled = bool
            session_recording_enabled = bool
            virtual_network_id = string
            environment = string
            zones = list(string)
        }
    ))
}