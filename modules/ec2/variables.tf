variable "user_data" {
  description = "The user data to provide when launching the instance"
  type        = string
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

variable "private_subnet_1a_id" {
  description = "The ID of the private subnet in the first AZ"
  type        = string
}

variable "availability_zone_1a" {
  description = "The availability zone of the first AZ"
  type        = string
}

variable "alb_sg" {
  description = "The ID of the ALB security group"
  type        = string
}

variable "application_sg" {
  description = "The ID of the application security group"
  type        = string
}

variable "ssm_sg" {
  description = "The ID of the SSM security group"
  type        = string
}

variable "env" {
  description = "The environment to deploy to"
  type        = string
  default     = "dev"
}
