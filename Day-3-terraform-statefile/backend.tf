
terraform {
backend "s3" {
bucket = "config-bucket-599758243254"
key    = "terraform.tfstate"
region = "ap-south-1"
}
}