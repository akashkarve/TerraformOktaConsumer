
variable "app_name" {
    type = string
    description = "application name"
}

variable "app_redirect_uris" {
    type = list(string)
    description = "application redirect uris"
}

variable "app_post_logout_redirect_uris" {
    type = list(string)
    description = "application post logout redirect uris"
    default = []
}

variable "app_grant_types" {
    type = list(string)
    description = "application grant types"
    default = [ "authorization_code" ]

    validation {
    condition = length([
        for gt in var.app_grant_types : true
        if contains(["authorization_code", "refresh_token"], gt)
        ]) == length(var.app_grant_types)

     error_message = "Allowed values : [\"authorization_code\", \"refresh_token\"]."
    }
}

variable "app_status" {
    type = string
    description = "Authorization server status"
    default = "ACTIVE"

    validation {
        condition = (
          contains(["ACTIVE", "INACTIVE"], var.app_status)
        )
        error_message = "Allowed values : [\"ACTIVE\", \"INACTIVE\"]."
      }
}