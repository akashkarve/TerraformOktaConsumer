
variable "okta_auth_server_name" {
    type = string
    description = "okta auth server name"
}

variable "scope_name" {
    type = string
    description = "okta auth server scope name"
}

variable "scope_desc" {
    type = string
    description = "okta auth server scope description"
    default = ""
}

variable "scope_consent" {
    type = string
    description = "Indicates whether a consent dialog is needed for the scope"
    default = "IMPLICIT"

    validation {
        condition = (
          contains(["IMPLICIT", "REQUIRED"], var.scope_consent)
        )
        error_message = "Allowed values : [IMPLICIT, REQUIRED]."
      }
}

