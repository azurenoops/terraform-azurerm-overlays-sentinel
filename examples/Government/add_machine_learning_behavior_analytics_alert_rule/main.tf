# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "mod_sentinel_machine_learning_behavior_analytics_alert_rule" {
  #source = "azurenoops/overlays-sentinel/azurerm//modules/machine_learning_behavior_analytics_alert_rule"  
  #version = "x.x.x"  
  source     = "../../../modules/machine_learning_behavior_analytics_alert_rule"
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_log_analytics_solution.solutions]

  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  alert_rule_template_guid   = "737a2ce1-70a3-4968-9e90-3e6aca836abf"
  enable_rule_alert          = var.enable_rule_alert
}
