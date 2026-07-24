
variable "ami_id" {
  type = string
  default = ""
}

variable "instance_type" {
  type = string
  default = ""
}

variable "tags" {
    type = string
    default = ""
}

variable "bucket_name" {
    type = string
    description = "The name of the S3 bucket"
    default = ""
    }

variable "user_name" {
    description = "The name of the IAM user"
    type = string   
    default = "Shakil345"
}


