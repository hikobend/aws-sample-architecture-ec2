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

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "username" {
  description = "The username for the master DB user"
  type        = string
  default     = "user"
}

variable "env" {
  description = "The environment to deploy to"
  type        = string
  default     = "dev"
}
