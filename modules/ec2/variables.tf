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

variable "private_subnet_1c_id" {
  description = "The ID of the private subnet in the second AZ"
  type        = string
}

variable "availability_zone_1a" {
  description = "The availability zone of the first AZ"
  type        = string
}

variable "availability_zone_1c" {
  description = "The availability zone of the second AZ"
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

variable "target_type" {
  description = "The type of target to use"
  type        = string
  default     = "instance"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
  default     = "ami-0329eac6c5240c99d"
}

variable "alb_access_log_bucket_acl" {
  description = "The canned ACL to apply"
  type        = string
  default     = "log-delivery-write"
}

variable "env" {
  description = "The environment to deploy to"
  type        = string
  default     = "dev"
}
