resource "azurerm_key_vault_secret" "kv_secret" {

  for_each = var.kv_secret

  name         = each.value.secret_name
  value        = each.value.secret_value
  key_vault_id = each.value.key_vault_id

  
  content_type     = each.value.content_type
  tags = each.value.tags

  not_before_date = each.value.not_before_date
  expiration_date = each.value.expiration_date
}
