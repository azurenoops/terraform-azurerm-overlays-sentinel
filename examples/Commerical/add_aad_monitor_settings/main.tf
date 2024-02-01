# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "mod_sentinel_aad_monitor_settings" {
  #source = "azurenoops/overlays-sentinel/azurerm//modules/aad_monitor_settings"  
  #version = "x.x.x"  
  source     = "../../../modules/aad_monitor_settings"
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_storage_account.sentinel_storage_account, azurerm_log_analytics_solution.solutions]

  log_analytics_workspace_name                = azurerm_log_analytics_workspace.sentinel_workspace.name
  log_analytics_workspace_resource_group_name = azurerm_resource_group.sentinel_rg.name

  data_connector_aad_logs = var.data_connector_aad_logs
  retention_policy_days   = var.retention_policy_days
}
