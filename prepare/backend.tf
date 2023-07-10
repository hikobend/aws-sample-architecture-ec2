terraform {
  backend "s3" {
    bucket  = "preprare-architecture-s3-bucket"
    key     = "prepare/terraform.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
  }
}
