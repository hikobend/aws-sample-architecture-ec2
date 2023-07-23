module "dev_tfstate" { # tfstateを管理するリソースを作成 S3, DynamoDB
  source        = "../../modules/dev_tfstate"
  acl           = local.dev_tfstate_s3.acl
  sse_algorithm = local.dev_tfstate_s3.sse_algorithm
  hash_key      = local.dev_tfstate_dynamodb.hash_key
}

module "network" {
  source = "../../modules/network"
  cidr   = local.network.vpc_cidr
}
