terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  cloud {
    organization = "aluay87_org"
    workspaces {
      name = "aluay87-1-WS"
    }
  }
}


locals {
  tags = {
    "environment" = var.environment
  }
}

# # Create a resource group
# resource "azurerm_resource_group" "rg1" {
#   name     = "Ahmed-Demos"
#   location = "East US"
#}

# Create resource type storage account
resource "azurerm_storage_account" "securestorage" {
  resource_group_name           = var.resource_group_name
  name                          = var.name
  location                      = var.location
  account_tier                  = "Standard"
  account_replication_type      = var.environment == "Production" ? "GRS" : "LRS"
  public_network_access_enabled = false
  tags                          = local.tags
}