# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "mod_sentinel_content_hub_solutions" {
  #source = "azurenoops/overlays-sentinel/azurerm"  
  #version = "x.x.x"  
  source     = "../../.."
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_log_analytics_solution.solutions]

  # Required Inputs
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  deploy_environment         = "dev"

  # Only Required for Conent Hub Solutions
  log_analytics_workspace_name     = azurerm_log_analytics_workspace.sentinel_workspace.name
  log_analytics_workspace_location = azurerm_resource_group.sentinel_rg.location
  resource_group_name              = azurerm_resource_group.sentinel_rg.name

  # Content Hub Solutions
  enable_solution_azure_activity = true

}
