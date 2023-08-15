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
  cidr = "10.1.0.0/16"

  azs              = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  database_subnets = ["10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]
  public_subnets   = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24"]

  create_database_subnet_group = true
  enable_nat_gateway           = true

  tags = local.global_tags
}
