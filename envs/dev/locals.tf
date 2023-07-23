locals {
  dev_tfstate_s3 = {
    acl           = "private"
    sse_algorithm = "AES256"
  }
  dev_tfstate_dynamodb = {
    hash_key = "LockID"
  }
  network = {
    vpc_cidr = "10.0.0.0/24"
  }
}
