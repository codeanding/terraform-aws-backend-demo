variable "project_name" {
  type        = string
  description = "Name prefix"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnets" {
  type        = list(string)
  description = "List of private subnets"
}

variable "ecs_task_role_arn" {
  type        = string
  description = "IAM role ARN for ECS task"
}

variable "execution_role_arn" {
  type        = string
  description = "IAM execution role ARN"
}

variable "ecr_repo_url" {
  type        = string
  description = "ECR image URL"
}

variable "alb_target_group_arn" {
  type        = string
  description = "Target group ARN for load balancer"
}

variable "app_port" {
  description = "Port exposed by the application container"
  type        = number
}

variable "alb_security_group_id" {
  type        = string
  description = "Security Group ID of the ALB to allow inbound traffic from"
}

variable "db_url" {
  type        = string
  description = "PostgreSQL connection string to be passed as an environment variable to the container"
}
