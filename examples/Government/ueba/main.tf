

module "mod_sentinel_ubea" {
  #source = "azurenoops/overlays-sentinel/azurerm"  
  #version = "x.x.x"  
  source     = "../../.."
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_storage_account.sentinel_storage_account, azurerm_log_analytics_solution.solutions]

  # Log Analytics Workspace
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  deploy_environment         = "dev"

  # UBEA  
  ueba_data_sources     = var.ueba_data_sources
  ueba_entity_providers = var.ueba_entity_providers

}
