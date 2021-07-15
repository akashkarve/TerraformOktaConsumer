

resource "okta_group" "okta_grp" {
  name        = var.group_name
  description = var.group_desc
}