# Output rds_inst information
output "rds_inst_identifier" {
  description = "The Instance identifier of the RDS instance"
  value       = aws_db_instance.rds_inst.identifier
}

output "rds_inst_resource_id" {
  description = "Resource ID of the RDS instance"
  value       = aws_db_instance.rds_inst.id
}

output "rds_inst_endpoint" {
  description = "The Endpoint of the RDS instance"
  value       = aws_db_instance.rds_inst.endpoint
}

output "rds_inst_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.rds_inst.arn
}

output "rds_inst_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = aws_db_instance.rds_inst.availability_zone
}

output "rds_inst_name" {
  description = "The name of the RDS Database"
  value       = aws_db_instance.rds_inst.db_name
}

output "rds_inst_engine" {
  description = "Engine name of the RDS instance"
  value       = aws_db_instance.rds_inst.engine
}

output "rds_inst_engine_version" {
  description = "Actual engine version of the RDS instance"
  value       = aws_db_instance.rds_inst.engine_version_actual
}

output "rds_inst_status" {
  description = "The RDS instance status"
  value       = aws_db_instance.rds_inst.status
}

output "rds_inst_username" {
  description = "The master user for the database"
  value       = aws_db_instance.rds_inst.username
}

output "rds_inst_port" {
  description = "The RDS instance port"
  value       = aws_db_instance.rds_inst.port
}

# Output rds_pargrp
output "rds_parameter_group_name" {
  description = "Name of the created parameter group"
  value       = module.rds_pargrp.rds_pargrp_group_name
}

output "rds_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.rds_pargrp.rds_pargrp_group_id
}

output "rds_parameter_group_arn" {
  description = "The db parameter group arn"
  value       = module.rds_pargrp.rds_pargrp_group_arn
}
