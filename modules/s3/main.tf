module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "preprare-architecture-s3-bucket"
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
    name = "preprare-architecture-s3-bucket"
  }
}

module "delete_me_s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "delete-me-preprare-architecture-s3-bucket"
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
    name = "delete-me-preprare-architecture-s3-bucket"
  }
}
