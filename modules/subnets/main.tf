resource "aws_vpc" "this" {

  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.is_public

  assign_generated_ipv6_cidr_block     = false
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"

  tags = var.tags

}