terraform {
  required_version = ">= 1.0.0"
  required_providers {
    b2 = {
      source = "Backblaze/b2"
    }
  }
}

provider "b2" {
  application_key    = var.B2_APPLICATION_KEY
  application_key_id = var.B2_APPLICATION_KEY_ID
  endpoint           = var.B2_ENDPOINT
}

resource "b2_bucket" "kubeconfig-bucket" {
  bucket_name = var.KUBECONFIG_BUCKET
  bucket_type = "allPrivate"
  default_server_side_encryption {
    algorithm = "AES256"
  }
}

resource "b2_bucket_file_version" "kubeconfig-bucket-file" {
  bucket_id = b2_bucket.kubeconfig-bucket.bucket_id
  file_name = "config"
  source    = var.KUBECONFIG_PATH
}
