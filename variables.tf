variable "name" {
  type = list(string)
  default = [ "lin","lau", "kay" ]
}

# variable "tag" {
#   type = map(object({
#     created_by = string
#     env = string
#     iac = bool

#   }))
#   default = {
#     "tag" = {
#       created_by ="terraform"
#       env = "dev"
#       iac = true
#     }
#   }
# }