resource "aws_subnet" "public-subnet" {
    vpc_id            = "${aws_vpc.default.id}"
    count             = "${length(split(",", lookup(var.azs, var.region)))}"
    cidr_block        = "${element(var.cidr_public, count.index)}"
    availability_zone = "${element(split(",", lookup(var.azs, var.region)), count.index)}"
    map_public_ip_on_launch = true

    tags {
        "Name" = "public-${element(split(",", lookup(var.azs, var.region)), count.index)}-sn"
    }
}