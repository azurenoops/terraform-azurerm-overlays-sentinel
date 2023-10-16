
module "mod_sentinel_ms_security_incident_alert_rule" {
  #source = "azurenoops/overlays-sentinel/azurerm//modules/ms_security_incident_alert_rule"  
  #version = "x.x.x"  
  source     = "../../../modules/ms_security_incident_alert_rule"
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_log_analytics_solution.solutions]

  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  product_filter             = var.product_filter
  display_name               = var.display_name
  severity_filter            = var.severity_filter
  alert_rule_template_guid   = var.alert_rule_template_guid
  description                = var.description
}
