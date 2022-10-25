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


# resource "aws_s3_bucket" "kubeconfig_bucket" {
#   bucket = var.KUBECONFIG_BUCKET
#   lifecycle {
#     prevent_destroy = true
#   }
#   cors_rule {
#     allowed_origins = ["*"]
#     allowed_methods = [""]
#     allowed_headers = ["*"]
#     expose_headers  = ["ETag"]
#     max_age_seconds = 3000
#   }
#   object_lock_enabled = true
#   provider            = aws
# }

# resource "aws_s3_bucket_acl" "kubeconfig_bucket_acl" {
#   bucket   = aws_s3_bucket.kubeconfig_bucket.id
#   acl      = "private"
#   provider = aws
# }


# resource "aws_s3_bucket_server_side_encryption_configuration" "kubeconfig_bucket_encryption" {
#   bucket = aws_s3_bucket.kubeconfig_bucket.id
#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
#   provider = aws
# }

# resource "aws_s3_bucket_versioning" "kubeconfig_bucket_version" {
#   bucket = aws_s3_bucket.kubeconfig_bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
#   provider = aws
# }

# resource "aws_s3_bucket_cors_configuration" "kubeconfig_bucket_cors" {
#   bucket = aws_s3_bucket.kubeconfig_bucket.id
#   cors_rule {
#     allowed_origins = ["*"]
#     allowed_methods = [""]
#     allowed_headers = ["*"]
#     expose_headers  = ["ETag"]
#     max_age_seconds = 3000
#   }
#   provider = aws
# }

resource "aws_s3_object" "kubeconfig_bucket_file" {
  bucket         = var.KUBECONFIG_BUCKET
  key            = "config"
  content_base64 = var.KUBECONFIG_B64
  provider       = aws
  # depends_on = [
  #   aws_s3_bucket_acl.kubeconfig_bucket_acl,
  #   aws_s3_bucket_server_side_encryption_configuration.kubeconfig_bucket_encryption,
  #   aws_s3_bucket_versioning.kubeconfig_bucket_version,
  #   aws_s3_bucket_cors_configuration.kubeconfig_bucket_cors,
  # ]
}
