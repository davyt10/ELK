resource "aws_security_group" "SecurityGroup"{
  name = "${var.sg_name}"
  vpc_id = "${var.vpc_id}"

  ingress{
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = ["${var.cidrlist}"]


  }

  egress{
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

