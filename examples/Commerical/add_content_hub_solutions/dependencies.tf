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

resource "azurerm_log_analytics_workspace" "sentinel_workspace" {
  name                = "log-sentinel"
  resource_group_name = azurerm_resource_group.sentinel_rg.name
  location            = module.mod_azure_region_lookup.location_cli
  sku                 = "PerGB2018"
  tags                = {}
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

