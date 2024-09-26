variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "env" {
  description = "Name of the environment"
  type        = string
  default     = "prod"
}
variable "owner" {
  description = "Owner of Project"
  type        = string
  default     = "roshan.poudel"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "fuji-tech-pipeline"
}

variable "application" {
  description = "Application name"
  type        = string
  default     = "fuji-tech-pipeline"
}
variable "web_autoscaling_group_name" {
  description = "ASG Name"
  type        = string
  default     = "Riddhasoft-web-asg"
}