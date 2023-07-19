terraform {
  backend "s3" {
    bucket  = "dev-bucket-architecture-s3-bucket"
    key     = "dev/terraform.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
  }
}
