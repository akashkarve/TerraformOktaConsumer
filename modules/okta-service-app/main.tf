

resource "okta_app_oauth" "okta-service-app" {
  label                       = var.app_name
  type                        = "service"
  status                      = var.app_status    
  token_endpoint_auth_method  = "client_secret_basic"
  auto_key_rotation           = false
  grant_types                 = ["client_credentials"]
  response_types              = ["token"]
  omit_secret                 = true
}