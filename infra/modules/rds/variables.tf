variable "project_name" {
  type        = string
  description = "Project name used as prefix for RDS resources (e.g., identifier, subnet group name)"
}

variable "db_password" {
  type        = string
  description = "Password for the PostgreSQL admin user"
  sensitive   = true
}

variable "db_name" {
  type        = string
  description = "Name of the PostgreSQL database to be created"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the RDS instance will be deployed"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for the RDS subnet group"
}

variable "ecs_security_group_id" {
  type        = string
  description = "Security group ID of the ECS service to allow inbound traffic to RDS"
}
