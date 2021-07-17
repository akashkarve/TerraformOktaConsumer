
variable "app_name" {
    type = string
    description = "application name"
}

variable "app_status" {
    type = string
    description = "Authorization server status"
    default = "ACTIVE"

    validation {
        condition = (
          contains(["ACTIVE", "INACTIVE"], var.app_status)
        )
        error_message = "Allowed values : [ACTIVE, INACTIVE]."
      }
}