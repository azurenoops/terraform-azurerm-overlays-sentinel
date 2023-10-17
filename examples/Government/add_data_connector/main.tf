# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "mod_sentinel_azure_security_center_connector" {
  #source = "azurenoops/overlays-sentinel/azurerm//modules/data_connectors/azure_security_center"  
  #version = "x.x.x"  
  source   = "../../../modules/data_connectors/azure_security_center"
  depends_on = [ azurerm_log_analytics_workspace.sentinel_workspace,azurerm_log_analytics_solution.solutions ]
  
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id  
}
