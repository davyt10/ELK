variable "elb_name" { }


variable "instances" { type = "list"}
variable "elb_subnets" { type = "list"}
variable "internal" {}


variable "sg_name" { }
variable "cidrlist" { type = "list"}
variable "vpc_id" { }

