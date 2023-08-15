variable "rds_pargrp_name" {
  description = "Name of the DB parameter group to associate"
  type        = string
}

variable "rds_pargrp_family" {
  description = "Major DB Family"
  type        = string
}

variable "rds_pargrp_parameters" {
  description = "A list of DB parameter maps to apply"
  type        = list(map(string))
  default     = []
}

variable "rds_pargrp_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
