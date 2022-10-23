output "kubeconfig_path" {
  value = data.local_sensitive_file.kube_config_local.filename
}
