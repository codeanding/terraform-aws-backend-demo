output "db_endpoint" {
  value       = aws_db_instance.this.address
  description = "RDS endpoint (hostname)"
}

output "db_url" {
  description = "Complete PostgreSQL connection string for Prisma or backend use"
  value       = "postgresql://${aws_db_instance.this.username}:${var.db_password}@${aws_db_instance.this.address}:${aws_db_instance.this.port}/${var.db_name}"
}
