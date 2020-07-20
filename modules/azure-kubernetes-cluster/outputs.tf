output "id" {
  description = "The Kubernetes Managed Cluster ID."
  value       = azurerm_kubernetes_cluster.K8s.id
}

output "private_fqdn" {
  description = "The FQDN for the Kubernetes Cluster when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster."
  value       = azurerm_kubernetes_cluster.K8s.private_fqdn
}

output "kube_config" {
  description = "A kube_config block as defined below."
  value       = azurerm_kubernetes_cluster.K8s.kube_config_raw
}

output "client_key" {
  value = azurerm_kubernetes_cluster.K8s.kube_config.0.client_key
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.K8s.kube_config.0.client_certificate
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.K8s.kube_config.0.cluster_ca_certificate
}

output "id" {
  description = "The Kubernetes Managed Cluster ID"
  value       = azurerm_kubernetes_cluster.K8s.id
}
