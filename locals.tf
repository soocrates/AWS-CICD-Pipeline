locals {
  env    = var.env
  region = var.region
  tags = {
    Environment = var.env
    Application = var.application
    Project     = var.project
  }
}