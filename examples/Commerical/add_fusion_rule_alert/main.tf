# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "mod_sentinel_fusion_alert_rule" {
  #source = "azurenoops/overlays-sentinel/azurerm"  
  #version = "x.x.x"  
  source     = "../../.."
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_storage_account.sentinel_storage_account, azurerm_log_analytics_solution.solutions]

  # Log Analytics Workspace
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  deploy_environment         = "dev"

  # Fusion Alert Rules
  fusion_alert_rules = {
    "fusion_alert_rule_1" = {
      alert_rule_template_guid = "f71aba3d-28fb-450b-b192-4e76a83015c8"
      enabled        = true
    }
  } 
}
