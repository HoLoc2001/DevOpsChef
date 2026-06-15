
variable "project_name" {
  default = "my-ecs-app"
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "container_port" {
  default = 80
}

variable "health_check_path" {
  default = "/"
}

variable "alb_security_group_id" {
  type = string
}
