resource "aws_db_parameter_group" "rds_pargrp" {
  name   = var.rds_pargrp_name
  family = var.rds_pargrp_family

  dynamic "parameter" {
    for_each = var.rds_pargrp_parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = lookup(parameter.value, "apply_method", null)
    }

  }

  lifecycle {
    create_before_destroy = true
  }

  tags = var.rds_pargrp_tags
}
