resource "aws_alb" "alb" {  
  name            = "${var.alb_name}"  
  subnets         = ["${aws_subnet.public-subnet.*.id}"]
  security_groups = ["${aws_security_group.sec-alb.id}"]
  internal        = false  
  idle_timeout    = "60"   
  tags {    
    Name    = "${var.alb_name}"    
  }
}

resource "aws_alb_listener" "alb_listener" {
  depends_on   = ["aws_alb_target_group.alb_target_group"]
  load_balancer_arn = "${aws_alb.alb.arn}"  
  port              = "${var.alb_listener_port}"  
  protocol          = "${var.alb_listener_protocol}"
  
  default_action {    
    target_group_arn = "${aws_alb_target_group.alb_target_group.arn}"
    type             = "forward"  
  }
}


resource "aws_alb_target_group" "alb_target_group" {  
  name     = "${var.target_group_name}"  
  port     = "${var.alb_listener_port}"  
  protocol = "HTTP"  
  vpc_id   = "${aws_vpc.default.id}"   
  tags {    
    name = "${var.target_group_name}"    
  }   
  health_check {    
    healthy_threshold   = 3    
    unhealthy_threshold = 5   
    timeout             = 5    
    interval            = 10    
    path                = "${var.target_group_path}"    
    port                = "${var.alb_listener_port}"  
  }
}

resource "aws_lb_target_group_attachment" "attach_instance-1" {
  target_group_arn = "${aws_alb_target_group.alb_target_group.arn}"
  target_id        = "${aws_instance.server-lab-1.id}"
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach_instance-2" {
  target_group_arn = "${aws_alb_target_group.alb_target_group.arn}"
  target_id        = "${aws_instance.server-lab-2.id}"
  port             = 80
}