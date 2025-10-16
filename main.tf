resource "tfe_registry_module" "tf_module" {
  vcs_repo {                                                # (Optional) Settings for the registry module's VCS repository. Forces a new resource if changed. One of vcs_repo or module_provider is required.
    display_identifier         = var.vcs_display_identifier # (Required) The display identifier for your VCS repository. For most VCS providers outside of BitBucket Cloud and Azure DevOps, this will match the identifier string.
    identifier                 = var.vcs_identifier         # (Required) A reference to your VCS repository in the format <organization>/<repository> where <organization> and <repository> refer to the organization (or project key, for Bitbucket Server) and repository in your VCS provider. The format for Azure DevOps is //_git/.
    oauth_token_id             = var.oauth_token_id         # (Optional) Token ID of the VCS Connection (OAuth Connection Token) to use. This conflicts with github_app_installation_id and can only be used if github_app_installation_id is not used.
    github_app_installation_id = null                       # (Optional) The installation id of the Github App. This conflicts with oauth_token_id and can only be used if oauth_token_id is not used.
    branch                     = null                       # (Optional) The repository branch that Terraform will execute from. Default to main.
    tags                       = null                       # (Optional) Specifies whether tag based publishing is enabled for the registry module. When tags is set to true, the branch must be set to an empty value.
    source_directory           = null                       # (Optional) The path to the module configuration files within the VCS repository. This feature is currently in beta and is not available to all users.
    tag_prefix                 = null                       #(Optional) The prefix to filter repository Git tags when using the tag-based publishing type in a repository that contains code for multiple modules. Without a prefix, HCP Terraform and Terraform Enterprise publish new versions for all modules with valid Git tags that use semantic versioning. This feature is currently in beta and is not available to all users.
  }
  module_provider = null # (Optional) Specifies the Terraform provider that this module is used for. For example, "aws"
  name            = null # (Optional) The name of registry module. It must be set if module_provider is used.
  organization    = null # (Optional) The name of the organization associated with the registry module. It must be set if module_provider is used, or if vcs_repo is used via a GitHub App.
  namespace       = null # (Optional) The namespace of a public registry module. It can be used if module_provider is set and registry_name is public.
  registry_name   = null # (Optional) Whether the registry module is private or public. It can be used if module_provider is set.
  initial_version = null # (Optional) This specifies the initial version for a branch based module. It can be used if vcs_repo.branch is set. If it is omitted, the initial modules version will default to 0.0.0.
  test_config {
    tests_enabled = null # (Optional) Specifies whether tests run for the registry module. Tests are only supported for branch-based publishing.
  }
}
