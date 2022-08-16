variable "name" {
  description = "The name of the Kubernetes cluster."
  type        = string
}

variable "location" {
  description = " The Azure location where the Kubernetes cluster will be provisioned."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this Kubernetes cluster will be provisioned."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the cluster."
  type        = map(string)
  default     = {}
}

variable "dns_prefix" {
  description = "The DNS prefix associated to the Kubernetes cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "The Kubernetes version deployed in the cluster."
  type        = string
  default     = null
}

variable "private_cluster_enabled" {
  description = "Whether or not the cluster is private. When in private mode, the API is exposed only to private addresses."
  type        = bool
  default     = true
}

variable "identity_type" {
  description = "The type of identity used for the Kubernetes cluster."
  type        = string
  default     = "SystemAssigned"
}

variable "role_based_access_control_enabled" {
  description = "Whether or not RBAC is enabled for this cluster."
  type        = bool
  default     = true
}

variable "network_plugin" {
  description = "The network plugin to use for networking."
  type        = string
  default     = "kubenet"
}

variable "network_policy" {
  description = "The network policy to be used with Azure CNI (one of `calico` or `azure`)."
  type        = string
  default     = "calico"
}

variable "load_balancer_sku" {
  description = "The SKU of the load balancer that will manage cluster traffic."
  type        = string
  default     = "standard"
}

variable "load_balancer_public_ip_ids" {
  description = "A set of IDs corresponding to the public IP addresses attached to the load balancer."
  type        = set(string)
  default     = []
}

variable "log_analytics_workspace_id" {
  description = "The ID of log analytics workspace to which AKS will output logs."
  type        = string
}

variable "oms_agent_enabled" {
  description = "Whether or not the OMS Agent is enabled."
  type        = bool
  default     = true
}
variable "node_pool_name" {
  description = "The name of default node pool."
  type        = string
  default     = "default"
}

variable "vm_size" {
  description = "The virtual machine size of each cluster node."
  type        = string
  default     = "Standard_DS2_v2"
}

variable "enable_auto_scaling" {
  description = "Whether or not auto-scaling is enabled."
  type        = bool
  default     = false
}

variable "node_count" {
  description = "The number of nodes required to be deployed."
  type        = number
  default     = 1
}

variable "vnet_subnet_id" {
  description = "The ID of the subnet into which the Kubernetes cluster will be deployed."
  type        = string
}

variable "os_disk_size_gb" {
  description = "The size of the OS disk (in GB)."
  type        = string
  default     = "30"
}

variable "node_pool_tags" {
  description = "A mapping of tags to assign to the nodes."
  type        = map(string)
  default     = {}
}

variable "api_server_authorized_ip_ranges" {
  description = "A list of IP networks in CIDR notation that are permitted to access the API of this cluster."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
