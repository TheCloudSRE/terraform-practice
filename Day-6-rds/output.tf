output "rds_instance_id" {
  description = "RDS instance ID"
  value       = aws_db_instance.custom_rds.id
}

output "rds_instance_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.custom_rds.endpoint
}

output "rds_instance_address" {
  description = "RDS instance address"
  value       = aws_db_instance.custom_rds.address
}

output "rds_instance_arn" {
  description = "RDS instance ARN"
  value       = aws_db_instance.custom_rds.arn
}

output "rds_db_subnet_group_name" {
  description = "RDS DB subnet group name"
  value       = aws_db_subnet_group.custom_rds_subnet_group.name
}

output "rds_security_group_id" {
  description = "RDS security group ID"
  value       = aws_security_group.custom_sg.id
}

