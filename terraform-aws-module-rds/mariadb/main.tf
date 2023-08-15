locals {
  rds_creds_pwd     = sensitive(jsondecode(data.aws_secretsmanager_secret_version.rds_creds_password.secret_string))
  rds_db_identifier = "rds-${var.region_code}-${var.environment}-mariadb-${var.application-id}-0${var.mariadb_rds_database_number}"
  rds_pargrp_name   = "pargrp-${var.region_code}-${var.environment}-mariadb-${var.application-id}-0${var.mariadb_rds_database_number}-v${replace(var.mariadb_rds_major_engine_version, ".", "-")}"
  rds_optgrp_name   = "optgrp-${var.region_code}-${var.environment}-mariadb-${var.application-id}-0${var.mariadb_rds_database_number}-v${replace(var.mariadb_rds_major_engine_version, ".", "-")}"
}
#--------------------------------------------------------------
# Setting and getting admin password from Secret Manager
#--------------------------------------------------------------
module "rds_sec" {
  source                  = "../modules/rds_sec"
  rds_sec_secret_name     = "${var.environment}/${local.rds_db_identifier}"
  rds_sec_secret_username = var.mariadb_rds_username
  rds_sec_tags            = merge(var.rds_tags, { "Name" : local.rds_db_identifier })
}

data "aws_secretsmanager_secret" "password" {
  depends_on = [module.rds_sec]
  name       = module.rds_sec.secret_name
}

data "aws_secretsmanager_secret_version" "rds_creds_password" {
  secret_id = data.aws_secretsmanager_secret.password.id
}

#--------------------------------------------------------------
# RDS Parameter Group
#--------------------------------------------------------------
module "rds_pargrp" {
  source                = "../modules/rds_pargrp"
  rds_pargrp_name       = local.rds_pargrp_name
  rds_pargrp_family     = var.mariadb_rds_pargrp_family
  rds_pargrp_parameters = var.mariadb_rds_pargrp_parameters
  rds_pargrp_tags       = merge(var.rds_tags, { "Name" : local.rds_pargrp_name })
}

#--------------------------------------------------------------
# RDS Option Group
#--------------------------------------------------------------
module "rds_optgrp" {
  source                          = "../modules/rds_optgrp"
  rds_optgrp_name                 = local.rds_optgrp_name
  rds_optgrp_engine               = var.mariadb_rds_engine
  rds_optgrp_major_engine_version = var.mariadb_rds_major_engine_version
  rds_optgrp_options              = var.mariadb_rds_options
  rds_optgrp_timeouts             = var.mariadb_rds_timeouts
  rds_optgrp_tags                 = merge(var.rds_tags, { "Name" : local.rds_optgrp_name })
}

#--------------------------------------------------------------
# RDS Instance
#--------------------------------------------------------------
resource "aws_db_instance" "rds_inst" {
  identifier              = local.rds_db_identifier
  allocated_storage       = var.mariadb_rds_allocated_storage
  storage_type            = var.mariadb_rds_storage_type
  iops                    = var.mariadb_rds_storage_iops
  storage_throughput      = var.mariadb_rds_storage_throughput
  storage_encrypted       = true
  engine                  = var.mariadb_rds_engine
  engine_version          = var.mariadb_rds_engine_version
  instance_class          = var.mariadb_rds_instance_class
  db_name                 = "${var.environment}${var.application-id}${var.mariadb_rds_database_number}"
  username                = var.mariadb_rds_username
  password                = local.rds_creds_pwd.password
  db_subnet_group_name    = var.mariadb_rds_db_subnet_group_name
  parameter_group_name    = local.rds_pargrp_name
  option_group_name       = local.rds_optgrp_name
  availability_zone       = var.availability_zone
  port                    = var.mariadb_rds_port
  maintenance_window      = var.mariadb_rds_maintenance_window
  backup_window           = var.mariadb_rds_backup_window
  backup_retention_period = var.mariadb_rds_backup_retention_period
  skip_final_snapshot     = true
  tags                    = merge(var.rds_tags, { "Name" : local.rds_db_identifier })

  timeouts {
    create = var.mariadb_rds_timeout_create
    update = var.mariadb_rds_timeout_update
    delete = var.mariadb_rds_timeout_delete
  }

  depends_on = [module.rds_pargrp]
}
