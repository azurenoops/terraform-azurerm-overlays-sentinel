

module "mod_sentinel_connector" {
  #source = "azurenoops/overlays-sentinel/azurerm//modules/data_connectors/asc"  
  #version = "x.x.x"  
  source   = "../../modules/data_connectors/asc"
  depends_on = [ azurerm_log_analytics_workspace.sentinel_workspace,azurerm_log_analytics_solution.solutions ]
  
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id  
}
