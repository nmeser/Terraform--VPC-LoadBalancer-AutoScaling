variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"   
}

variable "instance_type" {
  default  = "t2.micro"
}

variable "ami" {
  default = "ami-0b898040803850657"
  
}

variable "public_subnet_cidr" {
  type = list

}

variable "private_subnet_cidr" {
  type = list

}

variable "availability_zone" {
  type = list
}

variable "public_subnet_names" {
 type = list 
}

variable "private_subnet_names" {
 type = list 
}

variable "key_name" {
  default = "muzaffer"
}

variable "ec2s" {
  type= list
  default = ["ec2_fe","ec2_be"]
}