output "private_subnet_ids" {
  value = ["${aws_subnet.private-subnet.*.id}"]
}

output "public_subnet_ids" {
  value = ["${aws_subnet.public-subnet.*.id}"]
}

output "alb_dns_name" {
  description = "The DNS name of the ELB"
  value       = "${aws_alb.alb.dns_name}"
}

