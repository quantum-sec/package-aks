variable "name" {
  description = "The name of the Managed Kubernetes Cluster."
  type        = string
}

variable "location" {
  description = " The Azure location where the Managed Kubernetes Cluster will be provisioned."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this Managed Kubernetes Cluster will be provisioned."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "dns_prefix" {
  description = "The DNS prefix associated to the managed cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "Version of Managed Kubernetes Cluster."
  type        = string
  default     = "1.16.10"
}

variable "private_cluster_enabled" {
  description = "This is to expose API server to internal IP addresses only."
  type        = bool
  default     = false
}

variable "identity_type" {
  description = "The type of identity used for the managed cluster."
  type        = string
  default     = "SystemAssigned"
}

variable "client_id" {
  description = "This is the client id of azure AD application."
  type        = string
}

variable "client_secret" {
  description = "This is the client secret of azure AD application."
}

variable "network_plugin" {
  description = "Network plugin to use for networking."
  type        = string
  default     = "azure"
}

variable "load_balancer_sku" {
  description = "This is the sku for load balancer used for Kubernetes Cluster."
  type        = string
  default     = "Standard"
}

variable "log_analytics_workspace_id" {
  description = "The ID of log analytics workspace for AKS self monitoring by Sentinel."
  type        = string
}

variable "oms_agent_enabled" {
  description = "This is to enable oms agent on AKS cluster for self monitoring by sentinel."
  type        = bool
  default     = true
}

variable "kube_dashboard_enabled" {
  description = "This is to enable Kubernetes dashboard."
  type        = bool
  default     = true
}

variable "node_name" {
  description = "The name of node inside node pool."
  type        = string
  default     = "logstash"
}

variable "vm_size" {
  description = "The size of virtual machine for each node."
  type        = string
  default     = "Standard_DS2_v2"
}

variable "enable_auto_scaling" {
  description = "This is to enable auto-scaling of nodes."
  type        = bool
  default     = false
}

variable "node_count" {
  description = "The number of nodes required to be deployed."
  type        = number
  default     = 1
}

variable "vnet_subnet_id" {
  description = "The subnet id inside vnet where aks cluster is to be deployed."
  type        = string
}

variable "os_disk_size_gb" {
  description = "The size of os disk in gb."
  type        = string
  default     = "30"
}

variable "node_pool_tags" {
  description = "A mapping of tags to assign to the nodes."
  type        = map(string)
  default     = {}
}
