
variable "ami" {
  type = string
  description = "The AMI ID for the EC2 instance"
  default = ""
}

variable "instance_type" {
  type = string
  description = "The instance type for the EC2 instance"
  default = ""
}

variable "subnet_id" {
  type = string
  description = "The subnet ID for the EC2 instance"
  default = ""
}
