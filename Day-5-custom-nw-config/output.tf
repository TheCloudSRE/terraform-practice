output "vpc_id" {
  description = "The ID of the custom VPC"
  value       = aws_vpc.custom_vpc.id
}

output "subnet_id" {
  description = "The ID of the custom subnet"
  value       = aws_subnet.custom_subnet.id
}

output "internet_gateway_id" {
  description = "The ID of the custom Internet Gateway"
  value       = aws_internet_gateway.custom_igw.id
}

output "route_table_id" {
  description = "The ID of the custom route table"
  value       = aws_route_table.custom_route_table.id
}

output "security_group_id" {
  description = "The ID of the custom security group"
  value       = aws_security_group.custom_sg.id
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.custom_ec2.id
}

output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.custom_ec2.public_ip
}

output "private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.custom_ec2.private_ip
}
