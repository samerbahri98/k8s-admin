terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }
  }
}

resource "local_sensitive_file" "kube_config_local" {
  content_base64  = var.KUBECONFIG_CONTENT
  filename        = var.KUBECONFIG_PATH
  file_permission = 440
}
