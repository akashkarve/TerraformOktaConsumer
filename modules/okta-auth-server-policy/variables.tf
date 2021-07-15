
variable "okta_auth_server_name" {
    type = string
    description = "okta auth server name"
}

variable "policy_name" {
    type = string
    description = "okta auth server name"
}

variable "policy_desc" {
    type = string
    description = "okta auth server scope description"
    default = ""
}

variable "policy_priority" {
    type = number
    description = "policy priority"
    default = 1
}

variable "policy_allowed_clients" {
    type = list(string)
    description = "okta auth server name"
    default = [ "ALL_CLIENTS" ]
}

variable "policy_status" {
    type = string
    description = "policy status"
    default = "ACTIVE"

    validation {
        condition = (
          contains(["ACTIVE", "INACTIVE"], var.policy_status)
        )
        error_message = "Allowed values : [ACTIVE, INACTIVE]."
      }
}