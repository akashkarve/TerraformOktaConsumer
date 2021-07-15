
data "okta_auth_server" "okta-auth-server" {
  name = var.okta_auth_server_name
}


resource "okta_auth_server_scope" "okta-auth-server-scope" {
  auth_server_id   = data.okta_auth_server.okta-auth-server.id
  name             = var.scope_name
  description      = var.scope_desc 
  consent          = var.scope_consent
}

