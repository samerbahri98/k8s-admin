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
  required_version = ">= 1.3.0"
  required_providers {
    b2 = {
      source  = "Backblaze/b2"
      version = "0.8.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.36.1"
    }
    vultr = {
      source  = "vultr/vultr"
      version = "2.11.4"
    }
  }
}

module "vultr_dns" {
  source        = "./modules/vultr_dns"
  VULTR_API_KEY = var.VULTR_API_KEY
}

module "vultr_kubernetes" {
  source        = "./modules/vultr_kubernetes"
  VULTR_API_KEY = var.VULTR_API_KEY
}

module "s3_kubeconfig" {
  source                = "./modules/s3_kubeconfig"
  B2_APPLICATION_KEY    = var.BACKBLAZE_ACCESS_KEY
  B2_APPLICATION_KEY_ID = var.BACKBLAZE_ACCESS_ID
  KUBECONFIG_B64        = module.vultr_kubernetes.kubeconfig
  depends_on = [
    module.vultr_kubernetes
  ]
  providers = {
    aws = aws
    b2  = b2
  }
}
