#assign various variable values.
variable "aws_region" { default = "eu-west-1" }
variable "application" { default = "ELK" }


variable "availability_zone" {
  type = "map"
  default = {
    description = "List of availability zones"
    multi_az    = "eu-west-1a,eu-west-1b,eu-west-1c"
    AZa         = "eu-west-1a"
    AZb         = "eu-west-1b"
    AZc         = "eu-west-1c"
  }
}


variable "ami" {
  type = "map"
  default = {

  }
}


variable "Subnet" {
  type = "map"
  default = {



  }
}
