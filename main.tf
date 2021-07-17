

provider "okta" {
  org_name  = "dev-23649058"
  base_url  = "okta.com"
  api_token = "00TmIQZlU8P6wVALSGEj8H1IqGP6fCfgcvCsKeWWrA" ## admin token
}


# module "oktaauthserver" {
#   source                = "./modules/okta-auth-sever"
#   auth_server_audience  = "terraform-module-test"
#   auth_server_name      = "terraform-module-test"
#   auth_server_desc      = "terraform-module-test"
# }

module "oktagroup" {
    source      = "./modules/okta-group"
    group_name  = "test-grp-tf-module"
    group_desc  = "created via terraform module"    
}

module "oktascope" {
    source                 = "./modules/okta-auth-server-scope"
    okta_auth_server_name  = var.auth_server_name
    scope_name             = "test-scp-tf-module"
    scope_desc             = "created via terraform module"
}

module "oktapolicy" {
  source                 = "./modules/okta-auth-server-policy"
  okta_auth_server_name  = var.auth_server_name
  policy_name            = "Policy-1"
  policy_desc            = "Policy-1 created via terraform module"
  policy_priority        = "1"
  policy_status          = "ACTIVE"
}

# module "oktawebapp" {
#   source                        = "./modules/okta-web-app"
#   app_name                      = "terraform-module-web-app"
#   app_grant_types               = ["authorization_code", "refresh_token"]
#   app_redirect_uris             = ["http://localhost:8080"]
#   app_post_logout_redirect_uris = ["http://localhost:8080"]
# }

# module "oktaspaapp" {
#   source                        = "./modules/okta-spa-app"
#   app_name                      = "terraform-module-spa-app"
#   app_grant_types               = ["authorization_code"]
#   app_redirect_uris             = ["http://localhost:8080"]
#   app_post_logout_redirect_uris = ["http://localhost:8080"]
# }

# module "oktaserviceapp" {
#   source   = "./modules/okta-service-app"
#   app_name = "terraform-module-service-app"
# }
