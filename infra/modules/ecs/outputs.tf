output "ecs_cluster_name" {
  value       = aws_ecs_cluster.this.name
  description = "ECS cluster name"
}

output "ecs_service_name" {
  value       = aws_ecs_service.this.name
  description = "ECS service name"
}

output "task_sg_id" {
  description = "Security group ID used by ECS tasks"
  value       = aws_security_group.ecs_service.id
}
