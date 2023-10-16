

module "mod_sentinel_fusion_alert_rule" {
  #source = "azurenoops/overlays-sentinel/azurerm//modules/fusion_alert_rule"  
  #version = "x.x.x"  
  source     = "../../../modules/fusion_alert_rule"
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_log_analytics_solution.solutions]

  log_analytics_workspace_id = var.log_analytics_workspace_id
  name                       = var.name
  alert_rule_template_guid   = var.alert_rule_template_guid
  enable_rule_alert          = var.enable_rule_alert
}
