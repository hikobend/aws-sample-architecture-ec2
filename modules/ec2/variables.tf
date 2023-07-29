variable "env" {
  description = "The environment to deploy to"
  type        = string
  default     = "dev"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_1a_id" {
  description = "The ID of the public subnet in the first AZ"
  type        = string
}

variable "public_subnet_1c_id" {
  description = "The ID of the public subnet in the second AZ"
  type        = string
}

variable "alb_sg" {
  description = "The ID of the ALB security group"
  type        = string
}
