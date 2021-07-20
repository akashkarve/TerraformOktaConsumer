

data "okta_app_oauth" "okta-app" {
    label = var.app_name
}

data "okta_group" "okta-grp" {
  name = var.group_name
}


resource "okta_app_group_assignment" "app-group-assignment" {
  app_id   = data.okta_app_oauth.okta-app.id
  group_id = data.okta_group.okta-grp.id
}