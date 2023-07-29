output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "public_subnet_1a_id" {
  description = "The ID of the public subnet in the first AZ"
  value       = module.network.public_subnets[0]
}

output "public_subnet_1c_id" {
  description = "The ID of the public subnet in the second AZ"
  value       = module.network.public_subnets[1]
}

output "private_subnet_1a_id" {
  description = "The ID of the private subnet in the first AZ"
  value       = module.network.private_subnets[0]
}

output "availability_zone_1a" {
  description = "The availability zone of the first AZ"
  value       = module.network.azs[0]
}

output "alb_sg" {
  description = "The ID of the ALB security group"
  value       = module.alb_sg.security_group_id
}

output "application_sg" {
  description = "The ID of the application security group"
  value       = module.application_sg.security_group_id
}

output "ssm_sg" {
  description = "The ID of the SSM security group"
  value       = module.ssm_sg.security_group_id
}
