
variable "cidr" {
  type = string
  description = "The CIDR block for the VPC"
  default = ""
}

variable "subnet_cidr" {
  type = string
  description = "The CIDR block for the subnet"
  default = ""
}

variable "availability_zone" {
  type = string
  description = "The availability zone for the subnet"
  default = ""
}
