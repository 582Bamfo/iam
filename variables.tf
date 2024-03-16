variable "name" {
  type = list(string)
  default = [ "lin","lau", "kay" ]
}

 variable "ami" {
    default = "ami-0fc3317b37c1269d3"
    type = string
    description = "ami for the new env"
 }

 variable "instance_type" {
  default =  "t2.small"
  type = string
}

variable "tag_name" {
  default = "danb"
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