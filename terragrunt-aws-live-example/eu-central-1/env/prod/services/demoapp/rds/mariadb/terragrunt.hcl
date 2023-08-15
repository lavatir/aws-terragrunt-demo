terraform {
  source = "git::https://github.com/lavatir/aws-terragrunt-demo//terraform-aws-module-rds/mariadb?ref=v0.0.1"
  #source = "../../../../../../../../terraform-aws-module-rds//mariadb"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../../../../vpc"
}

############################################
# Locals

locals {
  env         = yamldecode(file(find_in_parent_folders("_env_identifier.yaml")))
  vars        = yamldecode(file(find_in_parent_folders("vars.yaml")))
  environment = local.env.id
  region_name = local.vars[local.environment].region_name
  region_code = local.vars[local.environment].region_code
  global_tags = local.vars[local.environment].tags

  application_id  = "demoapp"
  database_number = 1

  availability_zone = "${local.region_name}a"
}

inputs = {

  ########################################
  # Tags

  rds_tags = merge(
    local.global_tags,
    {
      "application-id" = local.application_id
    }
  )


  ########################################
  # Application and deployment specific parameters for RDS instance from locals
  environment       = local.environment
  region_name       = local.region_name
  region_code       = local.region_code
  availability_zone = local.availability_zone
  application-id    = local.application_id

  ########################################
  # RDS Instance parameters
  mariadb_rds_db_subnet_group_name = dependency.vpc.outputs.database_subnet_group_name

  mariadb_rds_apply_changes_immediately = false
  mariadb_rds_deletion_protection       = false

  mariadb_rds_database_number      = local.database_number
  mariadb_rds_engine               = "mariadb"
  mariadb_rds_major_engine_version = "10.6"
  mariadb_rds_engine_version       = "10.6.12"
  mariadb_rds_instance_class       = "db.t3.large"

  mariadb_rds_allocated_storage = 20
  mariadb_rds_storage_type      = "gp3"
  #mariadb_rds_storage_iops         = 16000
  #mariadb_rds_storage_throughput   = 1000

  mariadb_rds_port = 3306

  mariadb_rds_maintenance_window      = "Mon:00:00-Mon:03:00"
  mariadb_rds_backup_window           = "03:00-06:00"
  mariadb_rds_backup_retention_period = 1

  ########################################
  # RDS parameter group
  mariadb_rds_pargrp_family = "mariadb10.6"
  #mariadb_rds_pargrp_parameters = []

  mariadb_rds_options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"
      option_settings = [{
        name  = "SERVER_AUDIT_EVENTS"
        value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "15"
        }
      ]
  }]

}
