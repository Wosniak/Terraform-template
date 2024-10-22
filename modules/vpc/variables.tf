variable "is_public" {
  type = bool
}

variable "cidr_block" {
  type = string
}

variable "tags" {
  type = map(string)
}