
resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
}

output "subnet_id" {
  description = "The ID of the created subnet"
  value       = aws_subnet.my_subnet.id
}

# resource "aws_security_group" "my_security_group" {
#   name        = var.security_group_name
#   description = var.security_group_description
#   vpc_id      = aws_vpc.my_vpc.id

#   ingress {
#     from_port   = var.ingress_from_port
#     to_port     = var.ingress_to_port
#     protocol    = var.ingress_protocol
#     cidr_blocks = var.ingress_cidr_blocks
#   }

#   egress {
#     from_port   = var.egress_from_port
#     to_port     = var.egress_to_port
#     protocol    = var.egress_protocol
#     cidr_blocks = var.egress_cidr_blocks
#   }
# }

