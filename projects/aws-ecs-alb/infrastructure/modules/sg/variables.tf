variable "project_name" {
  default = "my-ecs-app"
}

variable "vpc_id" {
  type = string
}

variable "container_port" {
  default = 80
}
