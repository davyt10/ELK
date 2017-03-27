output "ELB_DNS"
{
  value = "${aws_elb.elb.dns_name}"


}

output "SG_ID" {value = "${aws_security_group.SecurityGroup.id}"}