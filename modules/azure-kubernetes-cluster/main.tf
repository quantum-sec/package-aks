# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE KUBERNETES CLUSTER
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.2"
}

resource "azurerm_kubernetes_cluster" "cluster" { # tfsec:ignore:AZU007
  name                              = var.name
  location                          = var.location
  resource_group_name               = var.resource_group_name
  node_resource_group               = "${var.resource_group_name}-cluster-resources"
  tags                              = var.tags
  kubernetes_version                = var.kubernetes_version
  private_cluster_enabled           = var.private_cluster_enabled
  dns_prefix                        = var.dns_prefix
  role_based_access_control_enabled = var.role_based_access_control_enabled

  identity {
    type = var.identity_type
  }


  network_profile {
    network_plugin    = var.network_plugin
    network_policy    = var.network_policy
    load_balancer_sku = var.load_balancer_sku

    load_balancer_profile {
      outbound_ip_address_ids = var.load_balancer_public_ip_ids
    }
  }

  oms_agent { # tfsec:ignore:AZU009
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  default_node_pool {
    name                = var.node_pool_name
    vm_size             = var.vm_size
    enable_auto_scaling = var.enable_auto_scaling
    node_count          = var.node_count
    vnet_subnet_id      = var.vnet_subnet_id
    os_disk_size_gb     = var.os_disk_size_gb
    tags                = var.node_pool_tags
  }

  api_server_authorized_ip_ranges = toset([coalesce(concat(var.api_server_authorized_ip_ranges, ["0.0.0.0/0"])...)])
}
