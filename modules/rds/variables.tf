variable "database_sg" {
  description = "The ID of the database security group"
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

variable "env" {
  description = "The environment to deploy to"
  type        = string
  default     = "dev"
}
