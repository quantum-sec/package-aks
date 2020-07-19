# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE KUBERNETES CLUSTER
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"
}

resource "azurerm_kubernetes_cluster" "K8s" {
  name                            = var.name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  tags                            = var.tags
  kubernetes_version              = var.kubernetes_version 
  private_cluster_enabled         = var.private_cluster_enabled #possibly needed for api to be exposed only to internal IPs
  dns_prefix                      = var.dns_prefix

  identity {
    type                          = var.identity_type
  }

  network_profile {
    network_plugin                = var.network_plugin
    load_balancer_sku             = var.load_balancer_sku
  }

  addon_profile {
    oms_agent { #required for monitoring K8s cluster by sentinel
      enabled                     = var.oms_agent_enabled
      log_analytics_workspace_id  = var.log_analytics_workspace_id
    }
    kube_dashboard {
      enabled                     = var.kube_dashboard_enabled
    }
  }

  default_node_pool {
      name                        = var.node_name
      vm_size                     = var.vm_size
      enable_auto_scaling         = var.enable_auto_scaling #if false then node_count, else min-max count
      node_count                  = var.node_count
      vnet_subnet_id              = var.vnet_subnet_id
      os_disk_size_gb             = var.os_disk_size_gb
      tags                        = var.node_pool_tags
    }
  }
}
