# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Enable SOAR Essentials for Send Email and Create Incident
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
  enable_solution_soar_essentials = true
}


module "mod_sentinel_automation_rule" {
  #source = "azurenoops/overlays-sentinel/azurerm"  
  #version = "x.x.x"  
  source     = "../../.."
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_storage_account.sentinel_storage_account, azurerm_log_analytics_solution.solutions]

  # Log Analytics Workspace
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  deploy_environment         = "dev"

  automation_rules = {
    "automation_rule1" = {
      display_name               = "Automation Rule"
      log_analytics_workspace_id = "${azurerm_log_analytics_workspace.sentinel_workspace.id}"
      name                       = uuid()
      order                      = 1
      condition_json             = <<CONDITION
                                    {                                     
                                      "conditions": [
                                        {
                                          "field": "AlertName",
                                          "equals": "Suspicious activity from a Tor exit node"
                                        }
                                      ]
                                    }
                                    CONDITION
      enabled                    = true
      triggers_on                = "Incidents"
      triggers_when              = "Created"
      action_incident = [
        {
          order                  = 1
          status                 = "New"
          classification         = "BenignPositive_SuspiciousButExpected"
          classification_comment = "Unclassified"
          labels                 = ["Tor"]
          owner_id               = "00000000-0000-0000-0000-000000000000"
          severity               = "Medium"
        }
      ]
    }
  }
}
