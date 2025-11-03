variable "kv_secret" {
  type = map(object(
    {
      secret_name  = string
      secret_value = string
      key_vault_id = string

      content_type = string
      tags         = map(string)

      not_before_date = string
      expiration_date = string
    }
  ))
}
