# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#---------------------------------------------------------
# Azure Region Lookup
#----------------------------------------------------------
module "mod_azure_region_lookup" {
  source  = "azurenoops/overlays-azregions-lookup/azurerm"
  version = "~> 1.0.0"

  azure_region = "eastus"
}

resource "azurerm_resource_group" "sentinel_rg" {
  name     = "rg-sentinel"
  location = module.mod_azure_region_lookup.location_cli
}

resource "azurerm_virtual_network" "sentinel_vnet" {
  name                = "vnet-sentinel"
  location            = module.mod_azure_region_lookup.location_cli
  resource_group_name = azurerm_resource_group.sentinel_rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "sentinel_subnet" {
  name                 = "snet-sentinel"
  resource_group_name  = azurerm_resource_group.sentinel_rg.name
  virtual_network_name = azurerm_virtual_network.sentinel_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_log_analytics_workspace" "sentinel_workspace" {
  name                = "log-sentinel"
  resource_group_name = azurerm_resource_group.sentinel_rg.name
  location            = module.mod_azure_region_lookup.location_cli
  sku                 = "PerGB2018"
  tags                = {}
}

resource "azurerm_storage_account" "sentinel_storage_account" {
  name                     = "storagesentinel"
  resource_group_name      = azurerm_resource_group.sentinel_rg.name
  location                 = module.mod_azure_region_lookup.location_cli
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = {}
}

resource "azurerm_log_analytics_solution" "solutions" {
  solution_name         = "SecurityInsights"
  location              = module.mod_azure_region_lookup.location_cli
  resource_group_name   = azurerm_resource_group.sentinel_rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  workspace_name        = azurerm_log_analytics_workspace.sentinel_workspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/SecurityInsights"
  }

  tags = {}

}

