locals {
  dev_tfstate_s3 = {
    acl           = "private"
    sse_algorithm = "AES256"
  }
  dev_tfstate_dynamodb = {
    hash_key = "LockID"
  }
  network = {
    vpc_cidr        = "10.0.0.0/24"
    azs             = ["ap-northeast-1a", "ap-northeast-1c"]
    public_subnets  = ["10.0.0.0/26", "10.0.0.64/26"]
    private_subnets = ["10.0.0.128/26", "10.0.0.192/26"]
  }
  ec2 = {
    user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install docker -y
    EOF
  }
}
