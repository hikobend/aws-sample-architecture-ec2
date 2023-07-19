module "s3_bucket_dev_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "dev-bucket-architecture-s3-bucket"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"
  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    name = "dev-bucket-architecture-s3-bucket"
  }
}

module "dynamodb_table" {
  source                         = "terraform-aws-modules/dynamodb-table/aws"
  name                           = "set_dev_dynamo_db"
  billing_mode                   = "PAY_PER_REQUEST"
  hash_key                       = "LockID"
  server_side_encryption_enabled = true
  point_in_time_recovery_enabled = true

  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]
}
