terraform {

}

resource "local_sensitive_file" "kube_config_local" {
  content_base64  = var.KUBECONFIG_CONTENT
  filename        = var.KUBECONFIG_PATH
  file_permission = 440
}
