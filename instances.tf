provider "aws" {
	access_key = "${var.access_key}"
	secret_key = "${var.secret_key}"
	region = "${var.region}"
}

resource "aws_key_pair" "lab-kp1" {
  key_name   = "lab-kp1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/ugCR9HS6l9vLu11JG/ZQC2mDVK+RUFC4Yq9ctAO00WOnG1DDR10UamMJZnf1S9r7qjLKzgzw3TIlwNnWpXrcd5CBsG6nFO0kmNDrdnLwDwxLJwBE/o2DCmCBQJD5b42P6L22XSSp03X93jDK/krvnShV67t4uQCoNdSZHvt8PqisBzmd9RHo4lpdlYOyZeJLTkQ+pbSBGTyyeMEorC/MmQaNEwHvILn3v7Hf4fhMhwBtJeSNDnAxL9it3jJwKPEkWrstKUclHz31ye2/TIUhXsmTLuWy4iKymFRL0uTqnYd5c88jAi46Lb5umA4ennF22aIVGiCYHIoBmWSUhDSUW3FZOSempQGniLV3p67puPhriVjFJMpEzek+dLALXHB1kugKncBrU/0ikVQMWQwlr415S1SYr/OOrNaQIBDgp7GPPjmP8maFob3UR4Hp14ZTsQKyyMZtS0RuX1MjRUQ20qv7ITyYWKNydHy9JF1TEGJPFBmQoPQwJpmdHjhPZMmesU4yBW0O1XUS2q+DHUjA17UONZfgt6/fW5W5CWKATyg8apP8eNZUpZbBcS0OVaPAxTp/9whe1CSbdSQs/+FuUjCo3UwXKnBXdaRr7kKj19aXUkml4rkJ0iOEO1QsBqiEHFMke0nPuREYn1aiwSCN6bd8ZUFJ6TIb3vMbv2DY9w=="
}


resource "aws_instance" "server-lab-1" {
	depends_on   = ["aws_route_table_association.private-subnet", "aws_key_pair.lab-kp1"]
	ami = "${lookup(var.ami-ubuntu, var.region)}"
	availability_zone = "${element(split(",", lookup(var.azs, var.region)), 0)}"
	instance_type = "t2.micro"
	key_name = "${var.key_name}"
	vpc_security_group_ids = ["${aws_security_group.sec-server-lab.id}"] 
	subnet_id = "${aws_subnet.private-subnet.0.id}"
	associate_public_ip_address = false
	user_data = "${file("templates/userdata-nginx")}"

	tags {
	Name = "server-lab-1"
	}
}

resource "aws_instance" "server-lab-2" {
	depends_on   = ["aws_route_table_association.private-subnet", "aws_key_pair.lab-kp1"]
	ami = "${lookup(var.ami-amzlinux, var.region)}"
	availability_zone = "${element(split(",", lookup(var.azs, var.region)), 1)}"
	instance_type = "t2.micro"
	key_name = "${var.key_name}"
	vpc_security_group_ids = ["${aws_security_group.sec-server-lab.id}"] 
	subnet_id = "${aws_subnet.private-subnet.1.id}"
	associate_public_ip_address = false
	user_data = "${file("templates/userdata-apache")}"

	tags {
	Name = "server-lab-2"
	}
}
