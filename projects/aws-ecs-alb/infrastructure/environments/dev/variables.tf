variable "aws_region" {
  default = "ap-southeast-1"
}

variable "project_name" {
  default = "my-ecs-app"
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "container_image" {
  type = string
}

variable "container_port" {
  default = 80
}

variable "health_check_path" {
  default = "/"
}

variable "cpu" {
  default = 256
}

variable "memory" {
  default = 512
}

variable "desired_count" {
  default = 1
}
