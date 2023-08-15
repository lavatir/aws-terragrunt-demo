output "rds_pargrp_group_name" {
  description = "Name of the created SG"
  value       = aws_db_parameter_group.rds_pargrp.*.name
}

output "rds_pargrp_group_id" {
  description = "The db parameter group id"
  value       = element(concat(aws_db_parameter_group.rds_pargrp.*.id, [""]), 0)
}

output "rds_pargrp_group_arn" {
  description = "The db parameter group arn"
  value       = aws_db_parameter_group.rds_pargrp.*.arn
}