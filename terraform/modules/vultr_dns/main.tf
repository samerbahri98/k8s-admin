terraform {
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
