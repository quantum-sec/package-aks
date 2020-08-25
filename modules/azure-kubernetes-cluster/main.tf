# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE KUBERNETES CLUSTER
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                    = var.name
  location                = var.location
  resource_group_name     = var.resource_group_name
  node_resource_group     = "${var.resource_group_name}-cluster-resources"
  tags                    = var.tags
  kubernetes_version      = var.kubernetes_version
  private_cluster_enabled = var.private_cluster_enabled
  dns_prefix              = var.dns_prefix

  identity {
    type = var.identity_type
  }

  network_profile {
    network_plugin    = var.network_plugin
    load_balancer_sku = var.load_balancer_sku

    load_balancer_profile {
      outbound_ip_address_ids = var.load_balancer_public_ip_ids
    }
  }

  addon_profile {
    oms_agent {
      enabled                    = var.oms_agent_enabled
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
    kube_dashboard {
      enabled = var.kube_dashboard_enabled
    }
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
}
