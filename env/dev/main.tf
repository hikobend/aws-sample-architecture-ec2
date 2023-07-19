resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/24"
}

module "dev_tfstate" {
  source = "../../modules/dev_tfstate"
}
