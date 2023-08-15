variable "rds_sec_secret_name" {
  description = "DB Identifier of RDS for which the secret will be created"
  type        = string
}

variable "rds_sec_secret_username" {
  description = "DB admin username which will be put in the secret"
  type        = string
}

variable "rds_sec_tags" {
  description = "Tags for the resource"
  type        = map(string)
  default     = {}
}
