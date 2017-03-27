resource "aws_vpc" "ELKVPC" {
  count            = 1
  cidr_block       = "${var.vpc_cidr}"
  tags {
    Name = "ELKVPC0${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count      = 2
  vpc_id     = "${aws_vpc.ELKVPC.id}"
  cidr_block = "${element(var.private_subnet_cidr, count.index)}"
  availability_zone = "${element(var.availability_zone, count.index)}"

  tags {
    Name = "ELK_PrivateSubnet0${count.index + 1}"
  }
}



resource "aws_subnet" "public" {
  count             =  1
  vpc_id            = "${aws_vpc.ELKVPC.id}"
  cidr_block        = "${element(var.public_subnet_cidr, count.index)}"
  availability_zone = "${element(var.availability_zone, count.index)}"
  tags {
    Name = "ELK_PublicSubnet0${count.index + 1}"
  }
}


resource "aws_route_table" "IGW" {
  vpc_id = "${aws_vpc.ELKVPC.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

}

resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.ELKVPC.id}"

}


resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.ELKVPC.id}"

  tags {
    Name = "ELK_IGW"
  }
}

resource "aws_route_table_association" "a" {
  count          = 2
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}" //Splat operater
  route_table_id = "${aws_route_table.IGW.id}"
}

resource "aws_route_table_association" "main" {
  count          = 2
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}" //Splat operater
  route_table_id = "${aws_route_table.main.id}"
}