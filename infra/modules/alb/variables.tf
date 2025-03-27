variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "app_port" {
  description = "Port exposed by the application container"
  type        = number
}
