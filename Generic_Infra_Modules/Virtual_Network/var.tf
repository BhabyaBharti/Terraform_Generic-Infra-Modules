variable "VNet" {
  type = map(object(
    {
      vnet_name           = string
      location            = string
      rg_name             = string

      address_space                  = list(string)
      edge_zone                      = string
      flow_timeout_in_minutes        = number
      private_endpoint_vnet_policies = string

      owner         = string
      co_owner      = string
      business_unit = string
      environment   = string
    }
    )
  )
}