module "network" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.0"

  cidr                 = "10.0.0.0/24"
  azs                  = ["ap-northeast-1a", "ap-northeast-1c"]
  public_subnets       = ["10.0.0.0/26", "10.0.0.64/26"]
  private_subnets      = ["10.0.0.128/26", "10.0.0.192/26"]
  public_subnet_names  = ["public-subnet-1a", "public-subnet-1c"]
  private_subnet_names = ["private-subnet-1a", "private-subnet-1c"]

  vpc_tags                 = { Name = "vpc" }
  public_route_table_tags  = { Name = "route-table-public" }
  private_route_table_tags = { Name = "route-table-private" }
  igw_tags                 = { Name = "internet-gateway" }
}
