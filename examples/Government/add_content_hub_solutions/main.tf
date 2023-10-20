# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "mod_sentinel_content_hub_solutions" {
  #source = "azurenoops/overlays-sentinel/azurerm//modules/aad_monitor_settings"  
  #version = "x.x.x"  
  source     = "../../../modules/content_hub_solutions"
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_storage_account.sentinel_storage_account, azurerm_log_analytics_solution.solutions]

  log_analytics_workspace_name    = azurerm_log_analytics_workspace.sentinel_workspace.name
  location                        = azurerm_log_analytics_workspace.sentinel_workspace.location
  resource_group_name             = azurerm_resource_group.sentinel_rg.name
  deploy_environment              = "dev"
  enable_solution_azure_ad        = true
  enable_solution_microsoft_365   = true
  enable_solution_soar_essentials = true
}
