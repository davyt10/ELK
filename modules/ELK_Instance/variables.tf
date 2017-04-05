variable "name" { }
variable "ami" { }
variable "subnet_ids" {type = "list"}
variable "aws_key_name" { }
variable "count" { }
variable "type" { }
variable "userdata" { }
variable "root_block_device" {}
variable "sg_name" { }
variable "vpc_id" { }

variable "WEB_SG_ID" {}

variable "Ansible_Inventory"{}
variable "Ansible_boot_play"{}