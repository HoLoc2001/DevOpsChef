
module "ecs" {
  source = "../../modules/ecs"


  vpc_id             = var.vpc_id
  public_subnet_ids  = var.public_subnet_ids
  container_image    = var.container_image
  container_port     = var.container_port
  health_check_path  = var.health_check_path
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


  vpc_id                = var.vpc_id
  public_subnet_ids     = var.public_subnet_ids
  container_image       = var.container_image
  container_port        = var.container_port
  health_check_path     = var.health_check_path
  project_name          = var.project_name
  alb_security_group_id = module.sg.alb_security_group_id
}

module "sg" {
  source = "../../modules/sg"


  vpc_id            = var.vpc_id
  public_subnet_ids = var.public_subnet_ids
  container_image   = var.container_image
  container_port    = var.container_port
  health_check_path = var.health_check_path
  project_name      = var.project_name
}

module "iam" {
  source = "../../modules/iam"


  vpc_id            = var.vpc_id
  public_subnet_ids = var.public_subnet_ids
  container_image   = var.container_image
  container_port    = var.container_port
  health_check_path = var.health_check_path
  project_name      = var.project_name
}
