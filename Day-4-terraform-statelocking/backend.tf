

terraform {
backend "s3" {
bucket = "config-bucket-599758243254"
key    = "Day-4/terraform.tfstate"
region = "ap-south-1"
use_lockfile = true
}
}