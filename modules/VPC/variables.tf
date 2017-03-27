variable "vpc_cidr" { description = "CIDR passed via module" }



variable "private_subnet_cidr" { type = "list"}
variable "public_subnet_cidr" { type = "list" }
variable "availability_zone" { type = "list"}

