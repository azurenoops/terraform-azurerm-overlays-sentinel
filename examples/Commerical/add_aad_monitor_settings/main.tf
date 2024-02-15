# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "mod_sentinel_aad_monitor_settings" {
  #source = "azurenoops/overlays-sentinel/azurerm"  
  #version = "x.x.x"  
  source     = "../../.."
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_storage_account.sentinel_storage_account, azurerm_log_analytics_solution.solutions]

  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  deploy_environment         = "dev"

  data_connector_aad_enabled = true
  data_connector_aad_logs    = var.data_connector_aad_logs  
}
