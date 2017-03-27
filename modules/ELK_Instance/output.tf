
output "instance_ids" { value = ["${aws_instance.instance.*.id}"] }
output "tag_name"    { value = "${aws_instance.instance.tags.Name}"}

output "SG_ID" {value = "${aws_security_group.SecurityGroup.id}"}