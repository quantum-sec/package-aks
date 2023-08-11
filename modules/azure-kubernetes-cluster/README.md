<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.18.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges) | A list of IP networks in CIDR notation that are permitted to access the API of this cluster. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | The DNS prefix associated to the Kubernetes cluster. | `string` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Whether or not auto-scaling is enabled. | `bool` | `false` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The type of identity used for the Kubernetes cluster. | `string` | `"SystemAssigned"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The Kubernetes version deployed in the cluster. | `string` | `null` | no |
| <a name="input_load_balancer_public_ip_ids"></a> [load\_balancer\_public\_ip\_ids](#input\_load\_balancer\_public\_ip\_ids) | A set of IDs corresponding to the public IP addresses attached to the load balancer. | `set(string)` | `[]` | no |
| <a name="input_load_balancer_sku"></a> [load\_balancer\_sku](#input\_load\_balancer\_sku) | The SKU of the load balancer that will manage cluster traffic. | `string` | `"standard"` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where the Kubernetes cluster will be provisioned. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of log analytics workspace to which AKS will output logs. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Kubernetes cluster. | `string` | n/a | yes |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | The network plugin to use for networking. | `string` | `"kubenet"` | no |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | The network policy to be used with Azure CNI (one of `calico` or `azure`). | `string` | `"calico"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of nodes required to be deployed. | `number` | `1` | no |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | The name of default node pool. | `string` | `"default"` | no |
| <a name="input_node_pool_tags"></a> [node\_pool\_tags](#input\_node\_pool\_tags) | A mapping of tags to assign to the nodes. | `map(string)` | `{}` | no |
| <a name="input_oms_agent_enabled"></a> [oms\_agent\_enabled](#input\_oms\_agent\_enabled) | Whether or not the OMS Agent is enabled. | `bool` | `true` | no |
| <a name="input_os_disk_size_gb"></a> [os\_disk\_size\_gb](#input\_os\_disk\_size\_gb) | The size of the OS disk (in GB). | `string` | `"30"` | no |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | Whether or not the cluster is private. When in private mode, the API is exposed only to private addresses. | `bool` | `true` | no |
| <a name="input_rbac_aad_admin_group_object_ids"></a> [rbac\_aad\_admin\_group\_object\_ids](#input\_rbac\_aad\_admin\_group\_object\_ids) | value | `list(string)` | `[]` | no |
| <a name="input_rbac_aad_azure_rbac_enabled"></a> [rbac\_aad\_azure\_rbac\_enabled](#input\_rbac\_aad\_azure\_rbac\_enabled) | value | `bool` | `true` | no |
| <a name="input_rbac_enabled"></a> [rbac\_enabled](#input\_rbac\_enabled) | Whether or not RBAC is enabled for this cluster. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which this Kubernetes cluster will be provisioned. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the cluster. | `map(string)` | `{}` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The virtual machine size of each cluster node. | `string` | `"Standard_DS2_v2"` | no |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | The ID of the subnet into which the Kubernetes cluster will be deployed. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | The client certificate used to access the Kubernetes cluster. |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | The private key corresponding to the provisioned client certificate. |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | The Kubernetes cluster's root CA certificate. |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The FQDN of the Kubernetes managed cluster. |
| <a name="output_host"></a> [host](#output\_host) | The hostname used to access the Kubernetes cluster. |
| <a name="output_id"></a> [id](#output\_id) | The Kubernetes managed cluster ID. |
| <a name="output_identity"></a> [identity](#output\_identity) | The managed identity used by master components. |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | A kube\_config block as defined below. |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | A kube\_config block as defined below. |
| <a name="output_kubelet_identity"></a> [kubelet\_identity](#output\_kubelet\_identity) | The managed identity assigned to the Kubelets. |
| <a name="output_private_fqdn"></a> [private\_fqdn](#output\_private\_fqdn) | The FQDN for the Kubernetes cluster when private link has been enabled, which is only resolvable inside the virtual network used by the Kubernetes cluster. |
<!-- END_TF_DOCS -->
