
variable "app_name" {
    type = string
    description = "application name"
}

variable "app_sso_url" {
    type = string
    description = "single sign on url of application"
}

variable "app_audience" {
    type = string
    description = "audience of application"
}

variable "app_status" {
    type = string
    description = "application status"
    default = "ACTIVE"

    validation {
        condition = (
          contains(["ACTIVE", "INACTIVE"], var.app_status)
        )
        error_message = "Allowed values : [\"ACTIVE\", \"INACTIVE\"]."
      }
}

variable "force_authn" {
    type = bool
    description = "honor force authentication"
    default = true
}
