output "vpc_id" { value = "${aws_vpc.ELKVPC.id}" }
output "private_subnet_id" { value = "${aws_subnet.private.id}" }
output "public_subnet_id" { value = "${aws_subnet.public.id}"}
output "vpc_id_main_route" { value = "${aws_vpc.ELKVPC.main_route_table_id}" }