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


variable "private_cluster_enabled" {
  description = "This is to expose API server to internal IP addresses only."
  type        = bool
  default     = true
}

variable "identity_type" {
  description = "The type of identity used for the managed cluster."
  type        = string
  default     = "SystemAssigned"
}

variable "network_plugin" {
  description = "Network plugin to use for networking."
  type        = string
  default     = "azure"
}

variable "load_balancer_sku" {
  description = "This is the sku for load balancer used for Kubernetes Cluster."
  type        = string
  default     = "standard"
}

variable "oms_agent_enabled" {
  description = "This is to enable oms agent on AKS cluster for self monitoring by sentinel."
  type        = bool
  default     = false
}

variable "kube_dashboard_enabled" {
  description = "This is to enable Kubernetes dashboard."
  type        = bool
  default     = true
}

variable "node_name" {
  description = "The name of node inside node pool."
  type        = string
  default     = "logstash-dev"
}

variable "vm_size" {
  description = "The size of virtual machine for each node."
  type        = string
  default     = "Standard_DS1_v2"
}

variable "node_count" {
  description = "The number of nodes required to be deployed."
  type        = number
  default     = 3
}
