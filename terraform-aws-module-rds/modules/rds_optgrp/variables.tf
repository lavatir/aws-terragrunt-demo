variable "rds_optgrp_name" {
  type = string
}
variable "rds_optgrp_engine" {
  type = string
}
variable "rds_optgrp_major_engine_version" {
  type = string
}
variable "rds_optgrp_options" {
  type    = list(any)
  default = []
}
variable "rds_optgrp_tags" {
  type = map(string)
}
variable "rds_optgrp_timeouts" {
  type = map(string)
}