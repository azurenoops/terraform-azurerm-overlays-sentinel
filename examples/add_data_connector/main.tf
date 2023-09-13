

module "mod_sentinel_connector" {
  #source = "azurenoops/overlays-sentinel/azurerm//modules/sentinel_connectors/asc"  
  #version = "x.x.x"  
  source   = "../../modules/sentinel_connectors/asc"
  depends_on = [ azurerm_log_analytics_workspace.sentinel_workspace,azurerm_log_analytics_solution.solutions ]
  
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id  
}
