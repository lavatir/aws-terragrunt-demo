output "rds_optgrp_option_group_id" {
  description = "The ARN of the RDS instance"
  value       = element(concat(aws_db_option_group.opt_rds.*.id, [""]), 0)
}