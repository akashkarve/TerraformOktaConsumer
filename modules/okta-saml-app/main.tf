

resource "okta_app_saml" "saml-app" {
  label                    = var.app_name 
  sso_url                  = var.app_sso_url
  recipient                = var.app_sso_url
  destination              = var.app_sso_url
  audience                 = var.app_audience
  status                   = var.app_status
  subject_name_id_format   = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
  response_signed          = true
  signature_algorithm      = "RSA_SHA256"
  digest_algorithm         = "SHA256"
  honor_force_authn        = var.force_authn
  subject_name_id_template = "$${user.userName}"
  authn_context_class_ref  = "urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport"
}
