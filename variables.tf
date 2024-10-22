locals {
  env = terraform.workspace == "default" ? "dev" : terraform.workspace

  commom_tags = {
    Project     = var.project
    ManagedBy   = "Terraform"
    Environment = local.env
  }

  region = var.region
}

variable "project" {
  type = string
}


variable "region" {
  type = string
}

variable "endpoints" {
  type = map(string)
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "skip_credentials_validation" {
  type = bool
}

variable "skip_metadata_api_check" {
  type = bool
}