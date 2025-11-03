variable "mssql_server" {
  type = map(object({
    sql_server_name              = string
    location                     = string
    RG_name                      = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string

    connection_policy                    = string
    public_network_access_enabled        = bool
    outbound_network_restriction_enabled = bool

    azuread_administrator = object({
      login_username = string
      object_id      = string
      tenant_id      = string
    })

    identity = object({
      type         = string
      identity_ids = list(string)
    })

    tags = map(string)

  }))
}
