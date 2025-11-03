resource "azurerm_resource_group" "RG" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}


# resource "azurerm_resource_group" "RG" {
#   name     = var.rg_name
#   location = var.location
#   tags = {
#     Owner    = var.tags.owner
#     Co-Owner = var.tags.co_owner
#   }
# }