

module "vpc" {
  source = "./modules/vpc"
  cidr = "10.0.0.0/16"
  availability_zone = "ap-south-1a"
  subnet_cidr = "10.0.0.0/24"

}

module "ec2" {
source = "./modules/ec2"
ami = "ami-09d88f7c4c272b0c5"
instance_type = "t3.micro"
subnet_id = module.vpc.subnet_id   # subnet_id - This is from output block from VPC module.
        # this is how we can pass the output of one module to another module as input.
}
