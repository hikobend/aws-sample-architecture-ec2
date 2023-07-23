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
