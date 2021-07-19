
terraform {
  required_version = ">= 0.12.29"
  required_providers {
    okta = {
      source = "okta/okta"
      version = "~> 3.10"
    }
  }
}