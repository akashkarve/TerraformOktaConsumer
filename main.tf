

provider "okta" {
  org_name  = "dev-23649058"
  base_url  = "okta.com"
  api_token = "" # admin token
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

module "oktapolicyrule" {
  source                         = "./modules/okta-auth-server-policy-rule"
  okta_auth_server_name          = var.auth_server_name
  policy_name                    = module.oktapolicy.auth-server-policy.name
  rule_status                    = "ACTIVE"
  rule_name                      = "RULE-1"
  rule_priority                  = 1
  grant_type_whitelist           = ["authorization_code", "password"]
  scope_whitelist                = [module.oktascope.okta-auth-server-scope.name]
  group_whitelist                = [ module.oktagroup.group.id ]
  access_token_lifetime_minutes  = 6
  refresh_token_lifetime_minutes = 6
  refresh_token_window_minutes   = 6

  depends_on = [
    module.oktapolicy,
  ]
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

# module "oktasamlapp" {
#   source       = "./modules/okta-saml-app"
#   app_name     = "terraform-saml-app"
#   app_sso_url  = "http://localhost:8080"
#   app_audience = "app-audience"
#   app_status   = "ACTIVE"
# }

# module "okta-app-group-assignment" {
#   source     = "./modules/okta-assign-app-to-group"
#   app_name   =  module.oktawebapp.okta_web_app.label 
#   group_name =  module.oktagroup.group.name
# }

###################### OUTPUTS ###################
# output "oktagroup_op" {
#   value = module.oktagroup.group
# }

# output "oktascope_op" {
#   value = module.oktascope.okta-auth-server-scope
# }

# output "oktapolicy_op" {
#   value = module.oktapolicy.auth-server-policy
# }

# output "oktapolicyrule_op" {
#   value = module.oktapolicyrule.auth-server-policy-rule
# }

# output "oktawebapp_op" {
#   value = module.oktawebapp.okta_web_app
#   sensitive = true
# }

# output "oktasamlapp_op" {
#   value = module.oktasamlapp.okta_saml_app
# }

# output "appgroupassignment_op" {
#   value = module.okta-app-group-assignment.app-group-assignment
# }
