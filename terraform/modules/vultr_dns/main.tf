terraform {
  required_version = ">= 1.3.0"
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.11.4"
    }
  }
}

data "vultr_dns_domain" "public_domain" {
  domain   = var.DOMAIN
  provider = vultr
}
