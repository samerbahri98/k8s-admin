terraform {

}

resource "local_sensitive_file" "kube_config_local" {
  ccontent_base64 = var.KUBECONFIG_CONTENT
  filename        = var.KUBECONFIG_PATH
  file_permission = 440
}

data "local_sensitive_file" "kube_config_local" {
  filename = var.KUBECONFIG_PATH
}
