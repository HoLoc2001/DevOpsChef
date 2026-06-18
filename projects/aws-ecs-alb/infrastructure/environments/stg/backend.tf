terraform {
  backend "s3" {
    bucket         = "terraform-state-620969609526-ap-southeast-1-an"
    key          = "dev/terraform.tfstate"
    region       = "ap-southeast-1"
    use_lockfile = true
    encrypt      = true
  }
}