variable "Subnet" {
  type = map(object(
    {
      subnet_name          = string
      vnet_name = string
      rg_name  = string

      address_prefixes                              = list(string)
      default_outbound_access_enabled               = bool
      private_endpoint_network_policies             = string
      private_link_service_network_policies_enabled = bool
      sharing_scope                                 = string
      service_endpoints                             = list(string)
      service_endpoint_policy_ids                   = list(string)
    }
  ))
}