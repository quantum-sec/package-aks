output "id" {
  description = "The Kubernetes managed cluster ID."
  value       = azurerm_kubernetes_cluster.cluster.id
}

output "fqdn" {
  description = "The FQDN of the Kubernetes managed cluster."
  value       = azurerm_kubernetes_cluster.cluster.fqdn
}

output "private_fqdn" {
  description = "The FQDN for the Kubernetes cluster when private link has been enabled, which is only resolvable inside the virtual network used by the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.cluster.private_fqdn
}

output "kube_config" {
  description = "A kube_config block as defined below."
  value       = azurerm_kubernetes_cluster.cluster.kube_config
}

output "kube_config_raw" {
  description = "A kube_config block as defined below."
  value       = azurerm_kubernetes_cluster.cluster.kube_config_raw
}

output "client_key" {
  description = "The private key corresponding to the provisioned client certificate."
  value       = azurerm_kubernetes_cluster.cluster.kube_config.0.client_key
  sensitive   = true
}

output "client_certificate" {
  description = "The client certificate used to access the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.cluster.kube_config.0.client_certificate
}

output "cluster_ca_certificate" {
  description = "The Kubernetes cluster's root CA certificate."
  value       = azurerm_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate
}

output "host" {
  description = "The hostname used to access the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.cluster.kube_config.0.host
}
