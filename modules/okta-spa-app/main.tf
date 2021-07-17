
# SPA with PKCE flow
resource "okta_app_oauth" "okta-spa-app" {
    
    type                       = "browser"
    label                      = var.app_name
    status                     = var.app_status    
    token_endpoint_auth_method = "none"
    auto_key_rotation          = false

    redirect_uris              = var.app_redirect_uris
    post_logout_redirect_uris  = var.app_post_logout_redirect_uris
 
    grant_types                = var.app_grant_types
    response_types             = ["code"]
 
    omit_secret                = true
}
