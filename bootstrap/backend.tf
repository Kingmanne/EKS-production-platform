terraform {
  backend "s3" {
    bucket       = "eks-platform-tfstate-371510064293"
    key          = "bootstrap/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}
