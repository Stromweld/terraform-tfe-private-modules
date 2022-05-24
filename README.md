# terraform-github-repositories

Terraform module for Terraform Cloud Private Modules

## References

<https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/registry_module>

## Usage

```hcl
provider "tfe" {
  token = var.tfc_token
}

resource "tfe_oauth_client" "test-oauth-client" {
  organization     = tfe_organization.test-organization.name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = "my-vcs-provider-token"
  service_provider = "github"
}

module "repositories" {
  source  = "app.terraform.io/Stromweld/private-modules/tfe"
  version = ">= 1.0.0"

  display_identifier = "my-org-name/terraform-provider-name"
  identifier         = "my-org-name/terraform-provider-name"
  oauth_token_id     = tfe_oauth_client.test-oauth-client.oauth_token_id
}
```

## Inputs

| Name | Type         | Default | Required | Description |
|------|--------------|---------|----------|-------------|
| `vcs_display_identifier` | string | | yes | The display identifier for your VCS repository. For most VCS providers outside of BitBucket Cloud, this will match the identifier string |
| `vcs_identifier` | string | | yes | A reference to your VCS repository in the format <organization>/<repository> where <organization> and <repository> refer to the organization (or project key, for Bitbucket Server) and repository in your VCS provider. The format for Azure DevOps is //_git/ |
| `oauth_token_id` | string | | yes | Token ID of the VCS Connection (OAuth Connection Token) to use |

## Outputs

| Name            | Description              |
|-----------------|--------------------------|
