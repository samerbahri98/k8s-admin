variable "KUBECONFIG_BUCKET" {
  type    = string
  default = "samerbahri98-k8s-admin-kubeconfig"
}

variable "KUBECONFIG_PATH" {
  type    = string
  default = "/tmp/config"
}

variable "B2_APPLICATION_KEY" {
  type = string
}

variable "B2_APPLICATION_KEY_ID" {
  type = string
}

variable "B2_ENDPOINT" {
  type    = string
  default = "https://s3.us-west-004.backblazeb2.com"
}
