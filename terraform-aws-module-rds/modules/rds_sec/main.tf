resource "random_password" "rds_pass" {
  length           = 16
  special          = true
  override_special = "_!%^"
}

resource "aws_secretsmanager_secret" "secret" {
  name = var.rds_sec_secret_name
  tags = var.rds_sec_tags
}

resource "aws_secretsmanager_secret_version" "password" {
  secret_id = aws_secretsmanager_secret.secret.id
  secret_string = jsonencode({
    "username" = var.rds_sec_secret_username,
    "password" = random_password.rds_pass.result
  })
}
