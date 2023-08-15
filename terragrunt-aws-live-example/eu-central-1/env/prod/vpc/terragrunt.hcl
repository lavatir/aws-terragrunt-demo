terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws//.?version=5.1.1"
}

include {
  path = find_in_parent_folders()
}

locals {
  env         = yamldecode(file(find_in_parent_folders("_env_identifier.yaml")))
  vars        = yamldecode(file(find_in_parent_folders("vars.yaml")))
  environment = local.env.id
  global_tags = local.vars[local.environment].tags
}

inputs = {
  ############################################
  # VPC settings

  name = "${local.environment}-vpc"
  cidr = "10.2.0.0/16"

  azs              = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets  = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
  database_subnets = ["10.2.4.0/24", "10.2.5.0/24", "10.2.6.0/24"]
  public_subnets   = ["10.2.101.0/24", "10.2.102.0/24", "10.2.103.0/24"]

  create_database_subnet_group = true
  enable_nat_gateway           = true

  tags = local.global_tags
}