module "network" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.0"

  cidr                   = var.cidr
  azs                    = var.azs
  public_subnets         = var.public_subnets
  private_subnets        = var.private_subnets
  public_subnet_names    = ["public-subnet-1a", "public-subnet-1c"]
  private_subnet_names   = ["private-subnet-1a", "private-subnet-1c"]
  enable_dns_hostnames   = true
  enable_dns_support     = true
  enable_nat_gateway     = true
  one_nat_gateway_per_az = true

  vpc_tags                 = { Name = "${var.env}-vpc" }
  public_route_table_tags  = { Name = "${var.env}-route-table-public" }
  private_route_table_tags = { Name = "${var.env}-route-table-private" }
  igw_tags                 = { Name = "${var.env}-internet-gateway" }
  nat_gateway_tags         = { Name = "${var.env}-nat-gateway" }
  nat_eip_tags             = { Name = "${var.env}-elatic-ip" }
}
