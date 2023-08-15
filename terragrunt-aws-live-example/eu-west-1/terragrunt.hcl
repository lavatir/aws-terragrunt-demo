remote_state {
  backend = "local"
  config = {
    path = "${get_parent_terragrunt_dir()}/${path_relative_to_include()}/state/terraform.tfstate"
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
}

/*
remote_state {
  backend = "s3"
  config = {
    bucket         = "change_this_to_your_tf_state_bucket"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }

  generate = {
    path = "backend.tf"
    if_exists = "overwrite"
  }

}
*/

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
    provider "aws" {
      region  = "eu-west-1"
    }
  EOF
}

