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
  alb = {
    target_type = "instance"
  }
  ec2 = {
    instance_type = "t2.micro"
    ami           = "ami-0329eac6c5240c99d"
    user_data     = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install docker -y
    EOF
  }
  s3 = {
    alb_access_log_bucket_acl = "log-delivery-write"
  }
  rds = {
    instance_class = "db.t3.micro"
    username       = "user"
  }
}
