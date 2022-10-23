terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.11.4"
    }
  }
}

data "vultr_kubernetes" "hlci_public" {
  filter {
    name   = "id"
    values = ["3a61ee7c-a445-4020-9d94-01b7e578293b"]
  }
  provider = vultr
}
