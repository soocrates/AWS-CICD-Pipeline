################################################################################
# Defines and manages the terraform versions
################################################################################
terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.67.0"
    }
  }
}

################################################################################
# Defines the resources provider
################################################################################

provider "aws" {
  region = local.region
  default_tags {
    tags = local.tags
  }
}
