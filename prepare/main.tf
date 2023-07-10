module "oidc" {
  source          = "../modules/oidc"
  account_id      = var.account_id
  user_name       = var.user_name
  repository_name = var.repository_name
}
