module "dev_tfstate" { # tfstateを管理するリソースを作成 S3, DynamoDB
  source        = "../../modules/dev_tfstate"
  acl           = local.dev_tfstate_s3.acl
  sse_algorithm = local.dev_tfstate_s3.sse_algorithm
  hash_key      = local.dev_tfstate_dynamodb.hash_key
}

module "network" {
  source          = "../../modules/network"
  cidr            = local.network.vpc_cidr
  azs             = local.network.azs
  public_subnets  = local.network.public_subnets
  private_subnets = local.network.private_subnets
  env             = var.env
}

module "ec2" {
  source               = "../../modules/ec2"
  user_data            = local.ec2.user_data
  vpc_id               = module.network.vpc_id
  public_subnet_1a_id  = module.network.public_subnet_1a_id
  public_subnet_1c_id  = module.network.public_subnet_1c_id
  private_subnet_1a_id = module.network.private_subnet_1a_id
  availability_zone_1a = module.network.availability_zone_1a
  alb_sg               = module.network.alb_sg
  application_sg       = module.network.application_sg
  ssm_sg               = module.network.ssm_sg
  env                  = var.env
}
