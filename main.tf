# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
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
      name = "TerraformCI"
    }
  }
}
# variable "ARM_CLIENT_ID"  {
#   type = string
# }
# variable "ARM_CLIENT_SECRET" {
#   type = string
# }
# variable "ARM_SUBSCRIPTION_ID" {
#   type = string
# }
# variable "ARM_TENANT_ID" {
#   type = string
# }

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
 # skip_provider_registration = true
}


resource "azurerm_resource_group" "rg" {
  name     = "Ahmed-Demos"
  location = "East US"
}

# Create resource type storage account
resource "azurerm_storage_account" "storage" {
  name                     = "tfsatest5096844tf123"
  location                 = "west europe"
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
