

terraform {
backend "s3" {
bucket = "config-bucket-599758243254"
key    = "Day-4/terraform.tfstate"
region = "ap-south-1"
use_lockfile = true # supports only Terraform v1.10.0 and above, for state locking 
# if terraform verson is less than 1.10.0, use the below code for state locking
# dynamodb_table = "terraform-state-locking" # Replace with your actual DynamoDB table  
}
}