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
  source                    = "../../modules/ec2"
  user_data                 = local.ec2.user_data
  vpc_id                    = module.network.vpc_id
  public_subnet_1a_id       = module.network.public_subnet_1a_id
  public_subnet_1c_id       = module.network.public_subnet_1c_id
  private_subnet_1a_id      = module.network.private_subnet_1a_id
  private_subnet_1c_id      = module.network.private_subnet_1c_id
  availability_zone_1a      = module.network.availability_zone_1a
  availability_zone_1c      = module.network.availability_zone_1c
  alb_sg                    = module.network.alb_sg
  application_sg            = module.network.application_sg
  ssm_sg                    = module.network.ssm_sg
  target_type               = local.alb.target_type
  instance_type             = local.ec2.instance_type
  ami                       = local.ec2.ami
  alb_access_log_bucket_acl = local.s3.alb_access_log_bucket_acl
  env                       = var.env
}

module "rds" {
  source               = "../../modules/rds"
  database_sg          = module.network.database_sg
  private_subnet_1a_id = module.network.private_subnet_1a_id
  private_subnet_1c_id = module.network.private_subnet_1c_id
  instance_class       = local.rds.instance_class
  username             = local.rds.username
  env                  = var.env
}
