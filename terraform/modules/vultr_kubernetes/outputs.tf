output "kubeconfig" {
  value = data.vultr_kubernetes.hlci_public.kube_config
}
