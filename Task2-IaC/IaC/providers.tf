terraform {
  required_version = ">=0.14.8"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.21.1"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.17.0"
    }
  }
}

provider "helm" {  
  kubernetes {  
    host                   = data.azurerm_kubernetes_cluster.account.kube_config[0].host  
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.account.kube_config[0].client_certificate)  
    client_key             = base64decode(data.azurerm_kubernetes_cluster.account.kube_config[0].client_key)  
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.account.kube_config[0].cluster_ca_certificate)  
  }  
}

data "azurerm_kubernetes_cluster" "account" {
  name                = "rcm_aks"
  resource_group_name = "rcm_aks_rg"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
