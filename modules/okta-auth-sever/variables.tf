
variable "auth_server_audience" {
    type = string
    description = "Authorization server audience"
}

variable "auth_server_name" {
    type = string
    description = "Authorization server name"
}

variable "auth_server_desc" {
    type = string
    description = "Authorization server description"
}

variable "auth_server_status" {
    type = string
    description = "Authorization server status"
    default = "ACTIVE"

    validation {
        condition = (
          contains(["ACTIVE", "INACTIVE"], var.auth_server_status)
        )
        error_message = "Allowed values : [ACTIVE, INACTIVE]."
      }
}