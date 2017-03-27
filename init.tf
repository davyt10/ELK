#init various variables that will be assigned values at a later date.

variable "aws_key_path" {}
variable "aws_key_name" {}

variable "vpc_cidr" { description = "VPC cidr block" }
variable "private_subnet_cidr" { description = "Main Subnet cidr block" }
variable "public_subnet_cidr" { description = "Public Subnet cidr block" }


data "aws_ami" "Ubuntu" {
  most_recent = true

  filter{
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-2017*"]
  }
}