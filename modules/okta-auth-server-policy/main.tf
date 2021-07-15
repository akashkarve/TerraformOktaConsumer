
data "okta_auth_server" "okta-auth-server" {
  name = var.okta_auth_server_name
}

resource "okta_auth_server_policy" "auth-server-policy" {
  auth_server_id   = data.okta_auth_server.okta-auth-server.id
  status           = var.policy_status
  name             = var.policy_name
  description      = var.policy_desc
  priority         = var.policy_priority
  client_whitelist = var.policy_allowed_clients
}