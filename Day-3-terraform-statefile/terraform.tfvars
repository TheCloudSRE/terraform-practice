
ami_id = "ami-0b910d1016287a5e7"
instance_type = "t3.micro"
tags = "MyInstanceUpdated"
bucket_name = "my-unique-terraformBucket-123456" 


# terraform apply -var-file="dev.tfvars" -var="bucket_name=my-unique-terraformBucket-123456" -var="ami_id=ami-0b910d1016287a5e7" -var="instance_type=t3.micro" -var="tags=MyInstance" 