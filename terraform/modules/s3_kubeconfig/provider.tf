provider "aws" {
  region                      = "us-west-1"
  access_key                  = var.B2_APPLICATION_KEY_ID
  secret_key                  = var.B2_APPLICATION_KEY
  skip_metadata_api_check     = true
  skip_credentials_validation = true
  endpoints {
    s3 = var.B2_ENDPOINT
  }

}

provider "b2" {
  application_key    = var.B2_APPLICATION_KEY
  application_key_id = var.B2_APPLICATION_KEY_ID
  endpoint           = var.B2_ENDPOINT
}
