terraform {
  backend "s3" {
    encrypt                     = true
    bucket                      = "samerbahri98-k8s-admin-terraform-state"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoint                    = "s3.us-west-004.backblazeb2.com"
    region                      = "us-west-1"
    key                         = "terraform.tfstate"
  }
}

module "vultr_dns" {
  source        = "./modules/vultr_dns"
  VULTR_API_KEY = var.VULTR_API_KEY
}
