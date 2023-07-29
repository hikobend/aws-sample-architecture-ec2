module "aws_account" {
  source = "terraform-aws-modules/ssm-parameter/aws"

  name                 = "aws_account"
  value                = "change me"
  ignore_value_changes = true
  secure_type          = true
}

module "region" {
  source = "terraform-aws-modules/ssm-parameter/aws"

  name                 = "region"
  value                = "change me"
  ignore_value_changes = true
  secure_type          = true
}
