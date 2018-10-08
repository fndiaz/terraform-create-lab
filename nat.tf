resource "aws_nat_gateway" "nat" {
    allocation_id = "${aws_eip.nat_eip.id}"
    subnet_id = "${aws_subnet.public-subnet.0.id}"
    depends_on = ["aws_internet_gateway.default"]
}