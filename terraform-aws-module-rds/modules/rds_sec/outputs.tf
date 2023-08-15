output "secret_name" {
  description = "The name of the AWS Secret for RDS user password"
  value       = aws_secretsmanager_secret.secret.name
}

output "id" {
  description = "The ID of the AWS Secret for RDS user password"
  value       = aws_secretsmanager_secret.secret.id
}