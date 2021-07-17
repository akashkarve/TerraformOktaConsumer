

resource "okta_auth_server" "okta-auth-server" {
  audiences   = [var.auth_server_audience]
  description = var.auth_server_desc
  name        = var.auth_server_name
  issuer_mode = "ORG_URL"
  status      = var.auth_server_status
}
