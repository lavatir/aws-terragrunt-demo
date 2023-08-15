## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rds_optgrp"></a> [rds\_optgrp](#module\_rds\_optgrp) | ../modules/rds_optgrp | n/a |
| <a name="module_rds_pargrp"></a> [rds\_pargrp](#module\_rds\_pargrp) | ../modules/rds_pargrp | n/a |
| <a name="module_rds_sec"></a> [rds\_sec](#module\_rds\_sec) | ../modules/rds_sec | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.rds_inst](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_secretsmanager_secret.password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.rds_creds_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application-id"></a> [application-id](#input\_application-id) | Unique ID of the application which this resource belongs to | `string` | n/a | yes |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Availability zone for the RDS instance. In case of a multi az deployment, the value should be mz | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Code of the environment, in which the RDS instance belongs to. | `string` | n/a | yes |
| <a name="input_mariadb_rds_allocated_storage"></a> [mariadb\_rds\_allocated\_storage](#input\_mariadb\_rds\_allocated\_storage) | The allocated storage in gigabytes | `number` | n/a | yes |
| <a name="input_mariadb_rds_allow_major_version_upgrade"></a> [mariadb\_rds\_allow\_major\_version\_upgrade](#input\_mariadb\_rds\_allow\_major\_version\_upgrade) | Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible | `bool` | `false` | no |
| <a name="input_mariadb_rds_apply_changes_immediately"></a> [mariadb\_rds\_apply\_changes\_immediately](#input\_mariadb\_rds\_apply\_changes\_immediately) | Changes should be applied immediately (true) or at next maintenance window (false) | `bool` | `false` | no |
| <a name="input_mariadb_rds_auto_minor_version_upgrade"></a> [mariadb\_rds\_auto\_minor\_version\_upgrade](#input\_mariadb\_rds\_auto\_minor\_version\_upgrade) | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window | `bool` | `false` | no |
| <a name="input_mariadb_rds_backup_retention_period"></a> [mariadb\_rds\_backup\_retention\_period](#input\_mariadb\_rds\_backup\_retention\_period) | The number of days to retain backups for | `number` | `1` | no |
| <a name="input_mariadb_rds_backup_window"></a> [mariadb\_rds\_backup\_window](#input\_mariadb\_rds\_backup\_window) | The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance\_window | `string` | `"03:00-06:00"` | no |
| <a name="input_mariadb_rds_character_set_name"></a> [mariadb\_rds\_character\_set\_name](#input\_mariadb\_rds\_character\_set\_name) | Character set of the Database. | `string` | `"AL32UTF8"` | no |
| <a name="input_mariadb_rds_cidr_blocks"></a> [mariadb\_rds\_cidr\_blocks](#input\_mariadb\_rds\_cidr\_blocks) | List of CIDR groups to associate | `list(string)` | `[]` | no |
| <a name="input_mariadb_rds_database_number"></a> [mariadb\_rds\_database\_number](#input\_mariadb\_rds\_database\_number) | Database number, must be between 1 and 9 | `number` | `1` | no |
| <a name="input_mariadb_rds_db_subnet_group_name"></a> [mariadb\_rds\_db\_subnet\_group\_name](#input\_mariadb\_rds\_db\_subnet\_group\_name) | Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC | `string` | `""` | no |
| <a name="input_mariadb_rds_deletion_protection"></a> [mariadb\_rds\_deletion\_protection](#input\_mariadb\_rds\_deletion\_protection) | Prevents the accidental dropping of the database. The database can be dropped only if this value is set to false. | `bool` | `false` | no |
| <a name="input_mariadb_rds_domain"></a> [mariadb\_rds\_domain](#input\_mariadb\_rds\_domain) | AD Domain ID | `string` | `""` | no |
| <a name="input_mariadb_rds_domain_iam_role_name"></a> [mariadb\_rds\_domain\_iam\_role\_name](#input\_mariadb\_rds\_domain\_iam\_role\_name) | AD Domain Access Role | `string` | `""` | no |
| <a name="input_mariadb_rds_engine"></a> [mariadb\_rds\_engine](#input\_mariadb\_rds\_engine) | The database engine to use | `string` | n/a | yes |
| <a name="input_mariadb_rds_engine_version"></a> [mariadb\_rds\_engine\_version](#input\_mariadb\_rds\_engine\_version) | The engine version to use | `string` | n/a | yes |
| <a name="input_mariadb_rds_final_snapshot_identifier"></a> [mariadb\_rds\_final\_snapshot\_identifier](#input\_mariadb\_rds\_final\_snapshot\_identifier) | The name of your final DB snapshot when this DB instance is deleted. | `string` | `null` | no |
| <a name="input_mariadb_rds_iam_database_authentication_enabled"></a> [mariadb\_rds\_iam\_database\_authentication\_enabled](#input\_mariadb\_rds\_iam\_database\_authentication\_enabled) | IAM database authentication switch | `bool` | `false` | no |
| <a name="input_mariadb_rds_instance_class"></a> [mariadb\_rds\_instance\_class](#input\_mariadb\_rds\_instance\_class) | The instance type of the RDS instance | `string` | n/a | yes |
| <a name="input_mariadb_rds_maintenance_window"></a> [mariadb\_rds\_maintenance\_window](#input\_mariadb\_rds\_maintenance\_window) | The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00' | `string` | `"Mon:00:00-Mon:03:00"` | no |
| <a name="input_mariadb_rds_major_engine_version"></a> [mariadb\_rds\_major\_engine\_version](#input\_mariadb\_rds\_major\_engine\_version) | Major DB Family | `string` | n/a | yes |
| <a name="input_mariadb_rds_max_allocated_storage"></a> [mariadb\_rds\_max\_allocated\_storage](#input\_mariadb\_rds\_max\_allocated\_storage) | The max storage size for Storage Autoscaling in gigabytes. Must be greater than or equal to mariadb\_rds\_allocated\_storage or 0 to disable Storage Autoscaling. | `number` | `0` | no |
| <a name="input_mariadb_rds_multi_az"></a> [mariadb\_rds\_multi\_az](#input\_mariadb\_rds\_multi\_az) | Specifies if the RDS instance is multi-AZ | `bool` | `false` | no |
| <a name="input_mariadb_rds_name"></a> [mariadb\_rds\_name](#input\_mariadb\_rds\_name) | The DB name to create. If omitted, no database is created initially | `string` | `""` | no |
| <a name="input_mariadb_rds_options"></a> [mariadb\_rds\_options](#input\_mariadb\_rds\_options) | A list of Options to apply | `list(any)` | <pre>[<br>  {<br>    "option_name": "MARIADB_AUDIT_PLUGIN",<br>    "option_settings": [<br>      {<br>        "name": "SERVER_AUDIT_EVENTS",<br>        "value": "CONNECT"<br>      },<br>      {<br>        "name": "SERVER_AUDIT_FILE_ROTATIONS",<br>        "value": "15"<br>      }<br>    ]<br>  }<br>]</pre> | no |
| <a name="input_mariadb_rds_pargrp_family"></a> [mariadb\_rds\_pargrp\_family](#input\_mariadb\_rds\_pargrp\_family) | Major DB Family | `string` | n/a | yes |
| <a name="input_mariadb_rds_pargrp_parameters"></a> [mariadb\_rds\_pargrp\_parameters](#input\_mariadb\_rds\_pargrp\_parameters) | A list of DB parameters to apply | `list(map(string))` | <pre>[<br>  {<br>    "apply_method": "immediate",<br>    "name": "require_secure_transport",<br>    "value": "1"<br>  }<br>]</pre> | no |
| <a name="input_mariadb_rds_performance_insights_enabled"></a> [mariadb\_rds\_performance\_insights\_enabled](#input\_mariadb\_rds\_performance\_insights\_enabled) | Specifies whether Performance Insights are enabled | `bool` | `true` | no |
| <a name="input_mariadb_rds_performance_insights_retention_period"></a> [mariadb\_rds\_performance\_insights\_retention\_period](#input\_mariadb\_rds\_performance\_insights\_retention\_period) | The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years). | `number` | `7` | no |
| <a name="input_mariadb_rds_port"></a> [mariadb\_rds\_port](#input\_mariadb\_rds\_port) | The port on which the DB accepts connections | `number` | `3306` | no |
| <a name="input_mariadb_rds_skip_final_snapshot"></a> [mariadb\_rds\_skip\_final\_snapshot](#input\_mariadb\_rds\_skip\_final\_snapshot) | Prevent creation of snapshot on delete | `bool` | `true` | no |
| <a name="input_mariadb_rds_snapshot_identifier"></a> [mariadb\_rds\_snapshot\_identifier](#input\_mariadb\_rds\_snapshot\_identifier) | Snapshot id for database restoration | `string` | `null` | no |
| <a name="input_mariadb_rds_storage_iops"></a> [mariadb\_rds\_storage\_iops](#input\_mariadb\_rds\_storage\_iops) | If mariadb\_rds\_storage\_type is set to io1, iops value should be added. For gp3 check documentation - https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html#gp3-storage | `number` | `null` | no |
| <a name="input_mariadb_rds_storage_throughput"></a> [mariadb\_rds\_storage\_throughput](#input\_mariadb\_rds\_storage\_throughput) | Storage throughput value for the DB Instance. Can only be set when mariadb\_rds\_storage\_type is 'gp3'. Documentation - https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html#gp3-storage | `number` | `null` | no |
| <a name="input_mariadb_rds_storage_type"></a> [mariadb\_rds\_storage\_type](#input\_mariadb\_rds\_storage\_type) | One of 'standard' (magnetic), 'gp2' (general purpose SSD old), 'gp3' (general purpose SSD), or 'io1' (provisioned IOPS SSD) | `string` | `"gp3"` | no |
| <a name="input_mariadb_rds_timeout_create"></a> [mariadb\_rds\_timeout\_create](#input\_mariadb\_rds\_timeout\_create) | Used for Creating Instances, Replicas, and restoring from Snapshots. | `string` | `"40m"` | no |
| <a name="input_mariadb_rds_timeout_delete"></a> [mariadb\_rds\_timeout\_delete](#input\_mariadb\_rds\_timeout\_delete) | Used for destroying databases. This includes the time required to take snapshots. | `string` | `"60m"` | no |
| <a name="input_mariadb_rds_timeout_update"></a> [mariadb\_rds\_timeout\_update](#input\_mariadb\_rds\_timeout\_update) | Used for Database modifications. | `string` | `"80m"` | no |
| <a name="input_mariadb_rds_timeouts"></a> [mariadb\_rds\_timeouts](#input\_mariadb\_rds\_timeouts) | Define maximum timeout for deletion of `aws_db_option_group` resource | `map(string)` | <pre>{<br>  "delete": "15m"<br>}</pre> | no |
| <a name="input_mariadb_rds_username"></a> [mariadb\_rds\_username](#input\_mariadb\_rds\_username) | Username for the master DB user | `string` | `"admin"` | no |
| <a name="input_mariadb_rds_vpc_security_group_ids"></a> [mariadb\_rds\_vpc\_security\_group\_ids](#input\_mariadb\_rds\_vpc\_security\_group\_ids) | List of VPC security groups to associate | `list(string)` | `[]` | no |
| <a name="input_rds_tags"></a> [rds\_tags](#input\_rds\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_region_code"></a> [region\_code](#input\_region\_code) | Code of the region, in which the RDS instance is deployed. | `string` | n/a | yes |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Name of the region, in which the RDS instance is deployed. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rds_inst_arn"></a> [rds\_inst\_arn](#output\_rds\_inst\_arn) | The ARN of the RDS instance |
| <a name="output_rds_inst_availability_zone"></a> [rds\_inst\_availability\_zone](#output\_rds\_inst\_availability\_zone) | The availability zone of the RDS instance |
| <a name="output_rds_inst_endpoint"></a> [rds\_inst\_endpoint](#output\_rds\_inst\_endpoint) | The Endpoint of the RDS instance |
| <a name="output_rds_inst_engine"></a> [rds\_inst\_engine](#output\_rds\_inst\_engine) | Engine name of the RDS instance |
| <a name="output_rds_inst_engine_version"></a> [rds\_inst\_engine\_version](#output\_rds\_inst\_engine\_version) | Actual engine version of the RDS instance |
| <a name="output_rds_inst_identifier"></a> [rds\_inst\_identifier](#output\_rds\_inst\_identifier) | The Instance identifier of the RDS instance |
| <a name="output_rds_inst_name"></a> [rds\_inst\_name](#output\_rds\_inst\_name) | The name of the RDS Database |
| <a name="output_rds_inst_port"></a> [rds\_inst\_port](#output\_rds\_inst\_port) | The RDS instance port |
| <a name="output_rds_inst_resource_id"></a> [rds\_inst\_resource\_id](#output\_rds\_inst\_resource\_id) | Resource ID of the RDS instance |
| <a name="output_rds_inst_status"></a> [rds\_inst\_status](#output\_rds\_inst\_status) | The RDS instance status |
| <a name="output_rds_inst_username"></a> [rds\_inst\_username](#output\_rds\_inst\_username) | The master user for the database |
| <a name="output_rds_parameter_group_arn"></a> [rds\_parameter\_group\_arn](#output\_rds\_parameter\_group\_arn) | The db parameter group arn |
| <a name="output_rds_parameter_group_id"></a> [rds\_parameter\_group\_id](#output\_rds\_parameter\_group\_id) | The db parameter group id |
| <a name="output_rds_parameter_group_name"></a> [rds\_parameter\_group\_name](#output\_rds\_parameter\_group\_name) | Name of the created parameter group |
