variable "common_endpoint_config" {
  description = "Common configuration for VPC endpoints"
  type = map(object({
    service_name = string
    tag_name     = string
  }))
  default = {
    ssm = {
      service_name = "com.amazonaws.ap-northeast-1.ssm"
      tag_name     = "ssm"
    }
    ssmmessages = {
      service_name = "com.amazonaws.ap-northeast-1.ssmmessages"
      tag_name     = "ssmmessages"
    }
    ec2messages = {
      service_name = "com.amazonaws.ap-northeast-1.ec2messages"
      tag_name     = "ec2messages"
    }
  }
}

variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/24"
}

variable "azs" {
  description = "A list of availability zones in the region"
  type        = list(string)
  default     = ["ap-northeast-1a", "ap-northeast-1c"]
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.0.0/26", "10.0.0.64/26"]
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.0.128/26", "10.0.0.192/26"]
}

variable "env" {
  description = "The environment to deploy to"
  type        = string
  default     = "dev"
}
