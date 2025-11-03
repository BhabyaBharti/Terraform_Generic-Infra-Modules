variable "rg_name" {}
variable "location" {}
variable "tags" {
  type = map(string)
  # default={
  #         owner = "Default_Owner"
  #         co_owner = "Default_Co_Owner"          
  #     }
}

# variable "rg_name" {}
# variable "location" {}
# variable "tags" {
#   type = object({
#     owner    = optional(string, "Default_Owner")
#     co_owner = optional(string, "Default_Co-Owner")
#   })
# }