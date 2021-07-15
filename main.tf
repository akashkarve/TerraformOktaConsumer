

provider "okta" {
  org_name  = "dev-23649058"
  base_url  = "okta.com"
  api_token = "00TmIQZlU8P6wVALSGEj8H1IqGP6fCfgcvCsKeWWrA" ## admin token
}

module "oktagroup" {
    source            =  "git@github.com:akashkarve/TestTfModule.git"
    group_name        = "test-grp-tf-module"
    group_desc        = "created via terraform module"    
}


