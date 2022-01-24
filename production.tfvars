# This variables override default "var.tf" variables.
# If you want to add resources this file, you must identify your resources "var.tf" firstly.
# This file give you elasticity working with Terraform. 
# Working with this file use this command :  "terraform apply --var-file production.tfvars --auto-approve "

region="us-east-1"
availability_zone=["us-east-1a","us-east-1b"]
public_subnet_names = ["public_subnet_1a","public_subnet_1b"]
private_subnet_names = ["private_subnet_1a","private_subnet_1b"]
vpc_cidr="10.0.0.0/16"
public_subnet_cidr=["10.0.0.0/24","10.0.1.0/24"]
private_subnet_cidr=["10.0.2.0/24","10.0.3.0/24"]
ami = "ami-08e4e35cccc6189f4"          // change for your region & ami type
key_name = "your_keyname"              // change with your keypair 
ec2s = ["ec2_fe","ec2_be","ec2_db"]