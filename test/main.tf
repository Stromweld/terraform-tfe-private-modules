# Test github repo module
provider "tfe" {
  token = var.tfc_token
}

module "repositories" {
  source  = "app.terraform.io/Stromweld/private-modules/tfe"
  version = ">= 1.0.0"

  display_identifier = "Stromweld/test"
  identifier         = "Stromweld/test"
  oauth_token_id     = "ot-nUkDUqdN8z5Z6Qkj"
}
