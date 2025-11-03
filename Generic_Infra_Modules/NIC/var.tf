variable "nics" {
  type = map(object(
    {
      nic_name = string
      location = string
      rg_name  = string

      ip_configuration = optional(object({

        ip_config_name                                     = string
        subnet_id                                          = optional(string)
        private_ip_address_allocation                      = string
        gateway_load_balancer_frontend_ip_configuration_id = optional(string)
        private_ip_address_version                         = optional(number)
        public_ip_address_id                               = optional(string)
        primary                                            = optional(bool)
        private_ip_address                                 = optional(string)

    }))


      auxiliary_mode                 = string
      auxiliary_sku                  = string
      dns_servers                    = list(string)
      edge_zone                      = string
      ip_forwarding_enabled          = bool
      accelerated_networking_enabled = bool
      internal_dns_name_label        = string
      environment                    = string
    }
  ))

}
