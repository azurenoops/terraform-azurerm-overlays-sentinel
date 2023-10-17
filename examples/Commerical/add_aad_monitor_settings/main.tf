# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "mod_sentinel_aad_monitor_settings" {
  #source = "azurenoops/overlays-sentinel/azurerm//modules/aad_monitor_settings"  
  #version = "x.x.x"  
  source     = "../../../modules/aad_monitor_settings"
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_storage_account.sentinel_storage_account, azurerm_log_analytics_solution.solutions]

  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  log_analytics_storage_account_id = azurerm_storage_account.sentinel_storage_account.id

  enable_sign_in_logs = true
  enable_audit_logs = true
  enable_non_interactive_user_sign_in_logs = true
  enable_service_principal_sign_in_logs = true
  enable_managed_identity_sign_in_logs = true
  enable_provisioning_logs = true 
  enable_adfs_sign_in_logs = true
  enable_user_risk_events = true
  enable_risky_events = true
  enable_network_access_traffic_logs = true 
  enable_risky_service_principals = true
  enable_service_principal_risk_events = true
}
