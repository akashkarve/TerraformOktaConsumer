

variable "okta_auth_server_name" {
    type = string
    description = "okta auth server name"
}

variable "policy_name" {
    type = string
    description = "okta auth server policy name"
}

variable "rule_status" {
    type = string
    description = "rule status"
    default = "ACTIVE"
    validation {
        condition = (
          contains(["ACTIVE", "INACTIVE"], var.rule_status)
        )
        error_message = "Allowed values : [\"ACTIVE\", \"INACTIVE\"]."
      }
}

variable "rule_name" {
    type = string
    description = "rule name"
}

variable "rule_priority" {
    type = number
    description = "rule priority"
    default = 1
}

variable "group_whitelist" {
    type = list(string)
    description = "array of groupid to allow speific groups. [\"EVERYONE\"] to allow all groups."
    default = [ "EVERYONE" ]
}

variable "user_whitelist" {
    type = list(string)
    description = "array of userid to allow speific users. [] to allow all users."
    default = []
}

variable "grant_type_whitelist" {
    type = list(string)
    description = "allowed grant types"

    validation {
    condition = length([
        for gt in var.grant_type_whitelist : true
        if contains(["authorization_code", "implicit", "password", "client_credentials"], gt)
        ]) == length(var.grant_type_whitelist)

     error_message = "Allowed values : [\"authorization_code\", \"implicit\", \"password\", \"client_credentials\"]."
    }
}

variable "scope_whitelist" {
    type = list(string)
    description = "array of scope name to allow speific scopes. [\"*\"] to allow all scopes."
    default = ["*"]
}

variable "access_token_lifetime_minutes" {
    type = number
    description = "access token lifetime in minutes"
    default = 1

    validation {
        condition =  (5 <= var.access_token_lifetime_minutes && var.access_token_lifetime_minutes <= 1440)
        error_message = "Allowed values between 5 and 1440."
    }
}

variable "refresh_token_lifetime_minutes" {
    type = number
    description = "refresh token lifetime in minutes"
    default = 5
}

variable "refresh_token_window_minutes" {
    type = number
    description = "refresh token window in minutes"
    default = 1

    validation {
        condition =  (5 <= var.refresh_token_window_minutes && var.refresh_token_window_minutes <= 2628000)
        error_message = "Allowed values between 5 and 2628000."
    }
}