variable "pips" {
  type = map(object(
    {
      pip_name              = string
      rg_name           = string
      location          = string
      allocation_method = string

      zones                   = set(string)
      ddos_protection_mode    = string
      ddos_protection_plan_id = string
      domain_name_label       = string
      domain_name_label_scope = string
      edge_zone               = string
      idle_timeout_in_minutes = number
      ip_tags                 = map(string)
      ip_version              = number
      public_ip_prefix_id     = string
      reverse_fqdn            = string
      sku                     = string
      sku_tier                = string
      environment             = string
    }
  ))
}