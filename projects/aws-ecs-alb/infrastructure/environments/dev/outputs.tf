
output "alb_dns_name" {
  value = module.elb.aws_lb.dns_name
}
