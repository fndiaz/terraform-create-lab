resource "aws_route_table" "public-subnet" {
	vpc_id = "${aws_vpc.default.id}"

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.default.id}"
	}

	tags {
		Name = "Lab Public Subnet"
	}
}

resource "aws_route_table_association" "public-subnet" {
	count 			= "${length(split(",", lookup(var.azs, var.region)))}"
	subnet_id 		= "${element(aws_subnet.public-subnet.*.id, count.index)}"
	route_table_id 	= "${aws_route_table.public-subnet.id}"
}

resource "aws_route_table" "private-subnet" {
	vpc_id = "${aws_vpc.default.id}"

	route {
		cidr_block 		= "0.0.0.0/0"
		nat_gateway_id 	= "${aws_nat_gateway.nat.id}"
	}

	tags {
		Name = "Lab Private Subnet"
	}
}

resource "aws_route_table_association" "private-subnet" {
	count 			= "${length(split(",", lookup(var.azs, var.region)))}"
	subnet_id 		= "${element(aws_subnet.private-subnet.*.id, count.index)}"
	route_table_id 	= "${aws_route_table.private-subnet.id}"
}