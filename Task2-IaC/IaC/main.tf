# --- Infrastructure ---

# Create Resource Group
resource "azurerm_resource_group" "rcm_aks_rg" {
  name     = "rcm_aks_rg"
  location = "West Europe"
}

# Create AKS Cluster
resource "azurerm_kubernetes_cluster" "rcm_aks" {
  name                      = "rcm_aks"
  location                  = azurerm_resource_group.rcm_aks_rg.location
  resource_group_name       = azurerm_resource_group.rcm_aks_rg.name
  dns_prefix                = "rcm-aks"
  workload_identity_enabled = true
  oidc_issuer_enabled       = true
  
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
    upgrade_settings {
      drain_timeout_in_minutes      = 0
      max_surge                     = "10%"
      node_soak_duration_in_minutes = 0
    }
  }
  
  identity {
    type = "SystemAssigned"
  }
}

# Create Container Registry
resource "azurerm_container_registry" "acr" {
  name                     = "rcmMyAcr"
  resource_group_name      = azurerm_resource_group.rcm_aks_rg.name
  location                 = azurerm_resource_group.rcm_aks_rg.location
  sku                      = "Basic"
  admin_enabled            = true
  identity {
    type = "SystemAssigned"
  }
}

# --- Database --- 

# Installing Bitnami MongoDB Helm Chart in my k8s cluster
resource "helm_release" "mongodb" {
  name       = "mongodb"
  namespace  = "default"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "mongodb"
  version    = var.mongodb_helm_version
  wait       = false
  values = sensitive([templatefile("./mongodb.values.yml.tpl", {
  })])
}

# --- Application ---
resource "helm_release" "node_todo" {
  name      = "node-todo"
  chart     = "../node-todo/helm/node-todo"
  namespace = "default"
  set {
    name  = "image.tag"
    value = "5"
  }
}
