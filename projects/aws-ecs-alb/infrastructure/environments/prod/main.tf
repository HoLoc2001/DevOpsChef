module "vpc" {
  source = "../../modules/vpc"

  project_name          = var.project_name
  aws_region            = var.aws_region
  vpc_cidr              = "10.0.0.0/16"
  public_subnet_1_cidr  = "10.0.1.0/24"
  public_subnet_2_cidr  = "10.0.2.0/24"
  private_subnet_1_cidr = "10.0.3.0/24"
  private_subnet_2_cidr = "10.0.4.0/24"
}

module "ecs" {
  source = "../../modules/ecs"

  public_subnet_ids  = module.vpc.public_subnet_ids
  container_image    = var.container_image
  container_port     = var.container_port
  cpu                = var.cpu
  memory             = var.memory
  desired_count      = var.desired_count
  project_name       = var.project_name
  execution_role_arn = module.iam.ecs_task_execution_role_arn

  security_group_id = module.sg.ecs_security_group_id
  target_group_arn  = module.elb.target_group_arn
}

module "elb" {
  source = "../../modules/elb"


  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  container_port        = var.container_port
  health_check_path     = var.health_check_path
  project_name          = var.project_name
  alb_security_group_id = module.sg.alb_security_group_id
}

module "sg" {
  source = "../../modules/sg"


  vpc_id            = module.vpc.vpc_id
  container_port    = var.container_port
  project_name      = var.project_name
}

module "iam" {
  source = "../../modules/iam"

  project_name      = var.project_name
}
