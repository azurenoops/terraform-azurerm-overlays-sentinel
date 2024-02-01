

module "mod_sentinel_ubea" {
  #source = "azurenoops/overlays-sentinel/azurerm//modules/ubea"  
  #version = "x.x.x"  
  source     = "../../../modules/ueba"
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_log_analytics_solution.solutions]

  ueba_data_sources                           = var.ueba_data_sources
  ueba_entity_providers                       = var.ueba_entity_providers
  log_analytics_workspace_name                = azurerm_log_analytics_workspace.sentinel_workspace.name
  log_analytics_workspace_resource_group_name = azurerm_resource_group.sentinel_rg.name
}
