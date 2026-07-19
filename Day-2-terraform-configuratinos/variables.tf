variable "cidr_block" {
  description = "The CIDR block of VPC"
  type = string
  default =""
}
variable "Name1" {
  description = "The name of VPC"
  type = string
  default =""
}

variable "tag" {
  description = "The name of tag"
  type = string
  default = ""
}