resource "azurerm_mssql_server" "sql_server" {

  for_each = var.mssql_server

  name                                 = each.value.sql_server_name
  location                             = each.value.location
  resource_group_name                  = each.value.RG_name
  version                              = each.value.version
  administrator_login                  = each.value.administrator_login
  administrator_login_password         = each.value.administrator_login_password
  minimum_tls_version                  = each.value.minimum_tls_version
  connection_policy                    = each.value.connection_policy
  public_network_access_enabled        = each.value.public_network_access_enabled
  outbound_network_restriction_enabled = each.value.outbound_network_restriction_enabled

  dynamic "azuread_administrator" {
    for_each = each.value.azuread_administrator != null ? [each.value.azuread_administrator] : []
    content {
      login_username = azuread_administrator.value.login_username
      object_id      = azuread_administrator.value.object_id
      tenant_id      = azuread_administrator.value.tenant_id
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  tags = each.value.tags

}
