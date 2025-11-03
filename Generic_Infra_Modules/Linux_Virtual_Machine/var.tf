variable "vms" {
  type = map(object(
    {
      vm_name  = string
      location = string
      rg_name  = string
      nic_id   = list(string)
      vm_size  = string

      license_type               = string
      admin_username             = string
      admin_password             = string
      allow_extension_operations = string
      availability_set_id        = string

      capacity_reservation_group_id = string
      computer_name                 = string
      secure_boot_enabled           = string

      user_data                    = string
      vtpm_enabled                 = string
      virtual_machine_scale_set_id = string
      zone                         = string

      source_image_reference = object({
        publisher = string
        offer     = string
        sku       = string
        version   = string
      })

      os_disk = object({
        os_disk_name = string
        caching      = string
        disk_size_gb = string
        storage_account_type = string
      })

      boot_diagnostics = object({
        storage_account_uri = string
      })


      disable_password_authentication = bool


      admin_ssh_key = object({
        username   = string
        public_key = string
      })

      plan = object({
        product   = string
        publisher = string
        name      = string
      })


      delete_os_disk_on_termination    = bool
      delete_data_disks_on_termination = bool
      primary_network_interface_id     = string
      proximity_placement_group_id     = string

      reboot_setting                                         = string
      priority                                               = string
      provision_vm_agent                                     = bool
      platform_fault_domain                                  = string
      patch_mode                                             = string
      max_bid_price                                          = string
      patch_assessment_mode                                  = string
      custom_data                                            = string
      dedicated_host_id                                      = string
      dedicated_host_group_id                                = string
      disk_controller_type                                   = string
      bypass_platform_safety_checks_on_user_schedule_enabled = bool
      edge_zone                                              = string
      encryption_at_host_enabled                             = bool
      eviction_policy                                        = string
      extensions_time_budget                                 = string

      tags = map(string)
    }
  ))
}
