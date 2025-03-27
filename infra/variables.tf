variable "aws_region" {
    description = "The AWS region to deploy resources."
    default     = "us-west-2"
}

variable "project_name" {
  description = "Name of the project used for naming resources"
  type        = string
  default     = "tcg-demo"
}

variable "app_port" {
  type        = number
  description = "Port exposed by the backend container"
  default     = 3000
}

variable "aws_profile" {
  description = "The AWS profile to use for authentication."
  default     = "codeanding"
}

variable "db_password" {
  description = "Password for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "Name of the database to create in the RDS instance"
  type        = string
}