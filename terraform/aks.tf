resource "azurerm_resource_group" "test01" {
  name     = "test-aks-01"
  location = " East US 2"
}

resource "azurerm_kubernetes_cluster" "test01" {
  name                = "aks-test01"
  location            = azurerm_resource_group.test01.location
  resource_group_name = azurerm_resource_group.test01.name
  dns_prefix          = "aks-test01"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2"
  }

  identity {
    type = "SystemAssigned"
  }
}

local_file {
  content = azurerm_kubernetes_cluster.test01.kube_config_raw
  filename = "~/.kube/config"
}
