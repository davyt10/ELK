resource "aws_elb" "elb" {
  name               = "${var.elb_name}"
  internal           = "${var.internal}"
  subnets            = ["${var.elb_subnets}"]
  security_groups    = ["${aws_security_group.SecurityGroup.id}"]


  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:80"
    interval            = 30
  }

  instances                   = ["${var.instances}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "ELB${var.elb_name}"
  }
}