provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# Networking (VPC, subnets, etc.)
module "network" {
  source       = "./modules/network"
  project_name = var.project_name
}

# IAM roles (for ECS tasks and execution)
module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
}

# ECR repository to store Docker images
module "ecr" {
  source       = "./modules/ecr"
  project_name = var.project_name
}

# Application Load Balancer
module "alb" {
  source       = "./modules/alb"
  project_name = var.project_name
  vpc_id       = module.network.vpc_id
  subnets      = module.network.public_subnets
  app_port     = var.app_port
}

# ECS service and task definition
module "ecs" {
  source                = "./modules/ecs"
  project_name          = var.project_name
  vpc_id                = module.network.vpc_id
  subnets               = module.network.private_subnets
  ecs_task_role_arn     = module.iam.ecs_task_role_arn
  execution_role_arn    = module.iam.execution_role_arn
  ecr_repo_url          = module.ecr.repository_url
  alb_target_group_arn  = module.alb.target_group_arn
  alb_security_group_id = module.alb.security_group_id
  app_port              = var.app_port
  db_url                = module.rds.db_url
}

# PostgreSQL RDS instance
module "rds" {
  source                = "./modules/rds"
  project_name          = var.project_name
  vpc_id                = module.network.vpc_id
  subnet_ids            = module.network.private_subnets
  db_password           = var.db_password
  db_name               = var.db_name
  ecs_security_group_id = module.ecs.task_sg_id
}
