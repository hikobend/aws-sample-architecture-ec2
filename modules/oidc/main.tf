module "iam_github_oidc_provider" {
  source = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-provider"
}

resource "aws_iam_policy" "Terraform-OIDC-policy" {
  name        = "Terraform-OIDC-policy"
  description = "Terraform-OIDC-policy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "NotAction" : [
          "iam:CreateServiceLinkedRole",
          "iam:DeleteServiceLinkedRole",
          "iam:ListRoles",
          "organizations:DescribeOrganization",
          "account:ListRegions"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "iam:CreateServiceLinkedRole",
          "iam:DeleteServiceLinkedRole",
          "iam:ListRoles",
          "organizations:DescribeOrganization",
          "account:ListRegions",
          "iam:GetPolicy",
          "iam:GetOpenIDConnectProvider"
        ],
        "Resource" : "arn:aws:iam::${var.account_id}:role/Terraform-OIDC-role"
      }
    ]
  })
}

resource "aws_iam_role" "Terraform-OIDC-role" {
  name = "Terraform-OIDC-role"
  assume_role_policy = jsonencode({
    "Version" : "2008-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "arn:aws:iam::${var.account_id}:oidc-provider/token.actions.githubusercontent.com"
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringLike" : {
            "token.actions.githubusercontent.com:sub" : "repo:${var.user_name}/${var.repository_name}:*"
          }
        }
      }
    ]
  })
  managed_policy_arns = [aws_iam_policy.Terraform-OIDC-policy.arn]
}
