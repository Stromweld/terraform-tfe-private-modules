variable "vcs_display_identifier" {
  type        = string
  description = "The display identifier for your VCS repository. For most VCS providers outside of BitBucket Cloud, this will match the identifier string."
}
variable "vcs_identifier" {
  type        = string
  description = "A reference to your VCS repository in the format <organization>/<repository> where <organization> and <repository> refer to the organization (or project key, for Bitbucket Server) and repository in your VCS provider. The format for Azure DevOps is //_git/."
}
variable "oauth_token_id" {
  type        = string
  description = "Token ID of the VCS Connection (OAuth Connection Token) to use."
}
