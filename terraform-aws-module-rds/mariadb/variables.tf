#--------------------------------------------------------------
# RDS Parameter Group
#--------------------------------------------------------------
variable "mariadb_rds_pargrp_family" {
  description = "Major DB Family"
  type        = string
}

variable "mariadb_rds_pargrp_parameters" {
  description = "A list of DB parameters to apply"
  type        = list(map(string))
  default = [
    {
      name         = "require_secure_transport"
      value        = "1"
      apply_method = "immediate"
    }
  ]

  validation {
    condition     = can(element([for m in var.mariadb_rds_pargrp_parameters : m if m.name == "require_secure_transport" && m.value == "1"], 0))
    error_message = "require_secure_transport must be set to 1."
  }

}

#--------------------------------------------------------------
# RDS Instance
#--------------------------------------------------------------
variable "mariadb_rds_database_number" {
  description = "Database number, must be between 1 and 9"
  type        = number
  default     = 1
  validation {
    condition     = var.mariadb_rds_database_number >= 1 && var.mariadb_rds_database_number <= 9
    error_message = "Database number must be between 1 and 9."
  }
}

variable "mariadb_rds_allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "mariadb_rds_max_allocated_storage" {
  description = "The max storage size for Storage Autoscaling in gigabytes. Must be greater than or equal to mariadb_rds_allocated_storage or 0 to disable Storage Autoscaling."
  type        = number
  default     = 0
}

variable "mariadb_rds_storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD old), 'gp3' (general purpose SSD), or 'io1' (provisioned IOPS SSD)"
  type        = string
  default     = "gp3"
}

variable "mariadb_rds_storage_iops" {
  description = "If mariadb_rds_storage_type is set to io1, iops value should be added. For gp3 check documentation - https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html#gp3-storage"
  type        = number
  default     = null
}

variable "mariadb_rds_storage_throughput" {
  description = "Storage throughput value for the DB Instance. Can only be set when mariadb_rds_storage_type is 'gp3'. Documentation - https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html#gp3-storage"
  type        = number
  default     = null
}

variable "mariadb_rds_engine" {
  description = "The database engine to use"
  type        = string
}

variable "mariadb_rds_engine_version" {
  description = "The engine version to use"
  type        = string
}

variable "mariadb_rds_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "mariadb_rds_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
  default     = ""
}

variable "mariadb_rds_username" {
  description = "Username for the master DB user"
  type        = string
  default     = "admin"
}

variable "mariadb_rds_db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
  type        = string
  default     = ""
}

variable "mariadb_rds_vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  type        = list(string)
  default     = []
}

variable "mariadb_rds_port" {
  description = "The port on which the DB accepts connections"
  type        = number
  default     = 3306
}

variable "mariadb_rds_multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = false
}

variable "mariadb_rds_maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  type        = string
  default     = "Mon:00:00-Mon:03:00"
}

variable "mariadb_rds_performance_insights_enabled" {
  description = "Specifies whether Performance Insights are enabled"
  type        = bool
  default     = true
}

variable "mariadb_rds_performance_insights_retention_period" {
  description = "The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years)."
  type        = number
  default     = 7
}

variable "mariadb_rds_iam_database_authentication_enabled" {
  description = "IAM database authentication switch"
  type        = bool
  default     = false
}

variable "mariadb_rds_character_set_name" {
  description = "Character set of the Database."
  type        = string
  default     = "AL32UTF8"
}

variable "mariadb_rds_deletion_protection" {
  description = "Prevents the accidental dropping of the database. The database can be dropped only if this value is set to false."
  type        = bool
  default     = false
}

variable "mariadb_rds_snapshot_identifier" {
  description = "Snapshot id for database restoration"
  type        = string
  default     = null
}

variable "mariadb_rds_skip_final_snapshot" {
  description = "Prevent creation of snapshot on delete"
  type        = bool
  default     = true
}

variable "mariadb_rds_final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted."
  type        = string
  default     = null
}

variable "mariadb_rds_cidr_blocks" {
  description = "List of CIDR groups to associate"
  type        = list(string)
  default     = []
}

variable "mariadb_rds_backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  type        = string
  default     = "03:00-06:00"
}

variable "mariadb_rds_backup_retention_period" {
  description = "The number of days to retain backups for"
  type        = number
  default     = 1
}

variable "mariadb_rds_major_engine_version" {
  description = "Major DB Family"
  type        = string
}

variable "mariadb_rds_allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  type        = bool
  default     = false
}

variable "mariadb_rds_auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  type        = bool
  default     = false
}

variable "mariadb_rds_options" {
  description = "A list of Options to apply"
  type        = list(any)
  default = [
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

  validation {
    condition = can(
      element(
        [for item in var.mariadb_rds_options : item if
          item.option_name == "MARIADB_AUDIT_PLUGIN" &&
          can(
            element([for setting in item.option_settings : setting if setting.name == "SERVER_AUDIT_EVENTS" && setting.value == "CONNECT"], 0)
          ) &&
          can(
            element([for setting in item.option_settings : setting if setting.name == "SERVER_AUDIT_FILE_ROTATIONS" && setting.value == "15"], 0)
          )
        ],
        0
      )
    )
    error_message = "The variable mariadb_rds_options must contain the specified structure with MARIADB_AUDIT_PLUGIN settings."
  }
}

variable "mariadb_rds_timeouts" {
  description = "Define maximum timeout for deletion of `aws_db_option_group` resource"
  type        = map(string)
  default = {
    delete = "15m"
  }
}

variable "mariadb_rds_domain" {
  description = "AD Domain ID"
  type        = string
  default     = ""
}

variable "mariadb_rds_domain_iam_role_name" {
  description = "AD Domain Access Role"
  type        = string
  default     = ""
}

variable "mariadb_rds_apply_changes_immediately" {
  description = "Changes should be applied immediately (true) or at next maintenance window (false)"
  type        = bool
  default     = false
}

variable "mariadb_rds_timeout_create" {
  description = "Used for Creating Instances, Replicas, and restoring from Snapshots."
  type        = string
  default     = "40m"

}

variable "mariadb_rds_timeout_update" {
  description = "Used for Database modifications."
  type        = string
  default     = "80m"

}

variable "mariadb_rds_timeout_delete" {
  description = "Used for destroying databases. This includes the time required to take snapshots."
  type        = string
  default     = "60m"

}


#--------------------------------------------------------------
# RDS Tags
#--------------------------------------------------------------
variable "rds_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

#--------------------------------------------------------------
# RDS Input parameter validation and naming convention helper
#--------------------------------------------------------------
variable "environment" {
  description = "Code of the environment, in which the RDS instance belongs to."
  type        = string
}

variable "region_name" {
  description = "Name of the region, in which the RDS instance is deployed."
  type        = string
}

variable "region_code" {
  description = "Code of the region, in which the RDS instance is deployed."
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the RDS instance. In case of a multi az deployment, the value should be mz"
  type        = string
}

variable "application-id" {
  description = "Unique ID of the application which this resource belongs to"
  type        = string
}
