provider "vultr" {
  api_key = var.VULTR_API_KEY
}

provider "aws" {
  region                      = "us-west-004"
  access_key                  = var.BACKBLAZE_ACCESS_ID
  secret_key                  = var.BACKBLAZE_ACCESS_KEY
  skip_metadata_api_check     = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_region_validation      = true
  endpoints {
    s3 = var.BACKBLAZE_ENDPOINT
  }

}

provider "b2" {
  application_key    = var.BACKBLAZE_ACCESS_KEY
  application_key_id = var.BACKBLAZE_ACCESS_ID
  endpoint           = var.BACKBLAZE_ENDPOINT
}

