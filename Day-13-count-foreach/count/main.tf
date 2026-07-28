
# ** Example - 1 

variable "tags" {
  description = "Tags to apply to the resources"
  type        = list(string)
  default     = ["Dev", "Test", "Prod"]
}

resource "aws_instance" "name" {
ami = "ami-01a00762f46d584a1"
instance_type = "t3.micro"
count = length(var.tags)
tags = {
Name = var.tags[count.index]
}
}

# ** Example - 2
# resource "aws_instance" "name" {
# ami = "ami-01a00762f46d584a1"
# instance_type = "t3.micro"
# count = 2
# tags = {
# Name = "dev-2"
# }
# }
