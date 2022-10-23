terraform {
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
  }
}

resource "b2_bucket" "kubeconfig-bucket" {
  bucket_name = var.KUBECONFIG_BUCKET
  bucket_type = "allPrivate"
  default_server_side_encryption {
    algorithm = "AES256"
  }
  provider = b2
}

resource "aws_s3_object" "kubeconfig-bucket-file" {
  bucket         = var.KUBECONFIG_BUCKET
  key            = "config"
  content_base64 = var.KUBECONFIG_B64
  provider       = aws
}
