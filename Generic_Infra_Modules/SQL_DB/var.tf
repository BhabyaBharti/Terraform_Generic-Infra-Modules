variable "mssql_db" {
  type = map(object({

    sql_db_name = string
    server_id   = string

    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string

    auto_pause_delay_in_minutes = number
    create_mode                 = string

    import = object({

      storage_uri                  = string
      storage_key                  = string
      storage_key_type             = string
      administrator_login          = string
      administrator_login_password = string
      authentication_type          = string
      storage_account_id           = string
    })

    creation_source_database_id    = string
    elastic_pool_id                = string
    geo_backup_enabled             = bool
    maintenance_configuration_name = string
    ledger_enabled                 = bool

    long_term_retention_policy = object({

      weekly_retention  = string
      monthly_retention = string
      yearly_retention  = string
      week_of_year      = string

    })

    min_capacity                          = string
    restore_point_in_time                 = string
    recovery_point_id                     = string
    restore_dropped_database_id           = string
    restore_long_term_retention_backup_id = string
    read_replica_count                    = number
    read_scale                            = string
    sample_name                           = string

    short_term_retention_policy = object({

      retention_days           = number
      backup_interval_in_hours = number

    })

    threat_detection_policy = object({

      state                      = string
      disabled_alerts            = string
      email_account_admins       = string
      email_addresses            = string
      retention_days             = number
      storage_account_access_key = string
      storage_endpoint           = string

    })

    transparent_data_encryption_enabled                        = bool
    transparent_data_encryption_key_automatic_rotation_enabled = bool
    transparent_data_encryption_key_vault_key_id               = string
    zone_redundant                                             = string
    secondary_type                                             = string

    tags = map(string)
  }))
}
