resource "aws_db_option_group" "opt_rds" {
  name                     = var.rds_optgrp_name
  option_group_description = "Terraform Option Group"
  engine_name              = var.rds_optgrp_engine
  major_engine_version     = var.rds_optgrp_major_engine_version

  dynamic "option" {
    for_each = var.rds_optgrp_options
    content {
      option_name                    = option.value.option_name
      port                           = lookup(option.value, "port", null)
      version                        = lookup(option.value, "version", null)
      db_security_group_memberships  = lookup(option.value, "db_security_group_memberships", null)
      vpc_security_group_memberships = lookup(option.value, "vpc_security_group_memberships", null)

      dynamic "option_settings" {
        for_each = lookup(option.value, "option_settings", [])
        content {
          name  = lookup(option_settings.value, "name", null)
          value = lookup(option_settings.value, "value", null)
        }
      }
    }
  }

  timeouts {
    delete = lookup(var.rds_optgrp_timeouts, "delete", null)
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = var.rds_optgrp_tags
}
