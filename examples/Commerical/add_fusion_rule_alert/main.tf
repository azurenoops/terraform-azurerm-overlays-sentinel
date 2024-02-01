# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "mod_sentinel_fusion_alert_rule" {
  #source = "azurenoops/overlays-sentinel/azurerm//modules/fusion_alert_rule"  
  #version = "x.x.x"  
  source     = "../../../modules/fusion_alert_rule"
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_log_analytics_solution.solutions]

  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  name                       = var.name
  alert_rule_template_guid   = "f71aba3d-28fb-450b-b192-4e76a83015c8"
  enable_rule_alert          = var.enable_rule_alert
}
