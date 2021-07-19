
data "okta_auth_server" "okta-auth-server" {
  name = var.okta_auth_server_name
}

data "okta_auth_server_policy" "okta-auth-server-policy" {
  auth_server_id = data.okta_auth_server.okta-auth-server.id
  name           = var.policy_name
}

resource "okta_auth_server_policy_rule" "auth_server_policy_rule" {
  auth_server_id                 = data.okta_auth_server.okta-auth-server.id
  policy_id                      = data.okta_auth_server_policy.okta-auth-server-policy.id
  status                         = var.rule_status
  name                           = var.rule_name
  priority                       = var.rule_priority
  group_whitelist                = var.group_whitelist
  user_whitelist                 = var.user_whitelist
  grant_type_whitelist           = var.grant_type_whitelist
  scope_whitelist                = var.scope_whitelist
  access_token_lifetime_minutes  = var.access_token_lifetime_minutes
  refresh_token_lifetime_minutes = var.refresh_token_lifetime_minutes
  refresh_token_window_minutes   = var.refresh_token_window_minutes
}