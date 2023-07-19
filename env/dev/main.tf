resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/24"
}

module "dev_tfstate_s3" {
  source = "../../modules/dev_tfstate_s3"
}
