module "oidc" {
  source          = "../modules/oidc"
  account_id      = var.account_id
  user_name       = var.user_name
  repository_name = var.repository_name
}

module "prepare_tfstate" {
  source = "../modules/prepare_tfstate"
}

module "parameter_store" {
  source = "../modules/parameter_store"
}
