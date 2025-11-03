resource "azurerm_linux_virtual_machine" "VM" {
  for_each = var.vms

  name                  = each.value.vm_name
  location              = each.value.location
  resource_group_name   = each.value.rg_name
  network_interface_ids = each.value.nic_id
  size                  = each.value.vm_size

  license_type               = each.value.license_type
  admin_username             = each.value.admin_username
  admin_password             = each.value.admin_password
  allow_extension_operations = each.value.allow_extension_operations
  availability_set_id        = each.value.availability_set_id

  capacity_reservation_group_id = each.value.capacity_reservation_group_id
  computer_name                 = each.value.computer_name
  custom_data                   = each.value.custom_data
  secure_boot_enabled           = each.value.secure_boot_enabled
  user_data                     = each.value.user_data
  vtpm_enabled                  = each.value.vtpm_enabled
  virtual_machine_scale_set_id  = each.value.virtual_machine_scale_set_id
  zone                          = each.value.zone

  dynamic "boot_diagnostics" {
    for_each = each.value.boot_diagnostics != null ? [each.value.boot_diagnostics] : []
    content {
      storage_account_uri = boot_diagnostics.value.storage_account_uri
    }
  }

  dynamic "source_image_reference" {
    for_each = each.value.source_image_reference != null ? [each.value.source_image_reference] : []
    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }

  }

  dynamic "os_disk" {
    for_each = each.value.os_disk != null ? [each.value.os_disk] : []
    content {
      name    = os_disk.value.os_disk_name
      caching = os_disk.value.caching
      disk_size_gb = os_disk.value.disk_size_gb
      storage_account_type = os_disk.value.storage_account_type
    }

  }


  dynamic "admin_ssh_key" {
    for_each = each.value.admin_ssh_key != null ? [each.value.admin_ssh_key] : []
    content {
      username   = admin_ssh_key.value.username
      public_key = admin_ssh_key.value.public_key
    }
  }

  dynamic "plan" {
    for_each = each.value.plan != null ? [each.value.plan] : []
    content {
      product   = plan.value.product
      publisher = plan.value.publisher
      name      = plan.plan.name
    }
  }

  disable_password_authentication                        = each.value.disable_password_authentication
  reboot_setting                                         = each.value.reboot_setting
  priority                                               = each.value.priority
  provision_vm_agent                                     = each.value.provision_vm_agent
  platform_fault_domain                                  = each.value.platform_fault_domain

  patch_mode                                             = each.value.patch_mode
  max_bid_price                                          = each.value.max_bid_price
  patch_assessment_mode                                  = each.value.patch_assessment_mode
  dedicated_host_id                                      = each.value.dedicated_host_id

  dedicated_host_group_id                                = each.value.dedicated_host_group_id
  disk_controller_type                                   = each.value.disk_controller_type
  bypass_platform_safety_checks_on_user_schedule_enabled = each.value.bypass_platform_safety_checks_on_user_schedule_enabled
  proximity_placement_group_id                           = each.value.proximity_placement_group_id

  edge_zone                                              = each.value.edge_zone
  encryption_at_host_enabled                             = each.value.encryption_at_host_enabled
  eviction_policy                                        = each.value.eviction_policy
  extensions_time_budget                                 = each.value.extensions_time_budget

  tags = each.value.tags

}
