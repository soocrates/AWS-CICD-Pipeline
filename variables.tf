################################################################################
# variables defination
################################################################################
variable "region" {
  description = "AWS region"
  type        = string
}

variable "env" {
  description = "Name of the environment"
  type        = string
}

#########################################################
## tag variable               
#########################################################
variable "owner" {
  description = "Owner of Project"
  type        = string
  default     = null
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "application" {
  description = "Application name"
  type        = string
}