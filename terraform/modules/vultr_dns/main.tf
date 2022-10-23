terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.11.4"
    }
  }
}

provider "vultr" {
  api_key = var.VULTR_API_KEY
}

data "vultr_dns_domain" "public_domain" {
  domain = var.DOMAIN
}
