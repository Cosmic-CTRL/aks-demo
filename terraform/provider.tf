terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.1.0"
    }
    local = {
      source = "hashicorp/local"
      version = "2.2.2"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "local" {
}
