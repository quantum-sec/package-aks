# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE KUBERNETES CLUSTER
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"
}

resource "azurerm_kubernetes_cluster" "K8s" {
  name                    = var.name
  location                = var.location
  resource_group_name     = var.resource_group_name
  tags                    = var.tags
  private_cluster_enabled = var.private_cluster_enabled
  dns_prefix              = var.dns_prefix

  default_node_pool {
    name       = var.node_name
    vm_size    = var.vm_size
    node_count = var.node_count
  }

  identity {
    type = var.identity_type
  }

  network_profile {
    network_plugin    = var.network_plugin
    load_balancer_sku = var.load_balancer_sku
  }

  addon_profile {
    oms_agent {
      enabled = var.oms_agent_enabled
    }
    kube_dashboard {
      enabled = var.kube_dashboard_enabled
    }
  }
}
