resource "aws_lb" "webapp_application_loadbalancer" {
  name               = "prod"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb_sucurity_group.id]
  subnets            = [for subnet in aws_subnet.PublicSubnets : subnet.id]

  enable_deletion_protection = false
  depends_on = [aws_subnet.PublicSubnets,aws_security_group.elb_sucurity_group]  
  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "alb_front_http" {
  name     = "alb-front-http"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.mainvpc.id
  depends_on = [
    aws_vpc.mainvpc
  ]
}

resource "aws_alb_target_group_attachment" "targetgroup_alb" {
  target_group_arn = "${aws_lb_target_group.alb_front_http.arn}"
  count    = "${length(var.public_subnet_cidr)}"
  port     = 80
  target_id        = "${element(aws_instance.PublicEC2.*.id, count.index)}"
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = "${aws_lb.webapp_application_loadbalancer.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_front_http.arn
  }
  depends_on = [
    aws_lb.webapp_application_loadbalancer,
    aws_lb_target_group.alb_front_http
  ]
}

