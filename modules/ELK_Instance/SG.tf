resource "aws_security_group" "SecurityGroup"{
  name = "${var.sg_name}"
  vpc_id = "${var.vpc_id}"

  ingress{
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = "true"
    security_groups = ["${var.WEB_SG_ID}"]

  }

  egress{
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

