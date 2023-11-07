# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Enable SOAR Essentials for Send Email and Create Incident
module "mod_sentinel_content_hub_solutions" {
  source     = "../../../modules/content_hub_solutions"
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_log_analytics_solution.solutions]

  log_analytics_workspace_name    = azurerm_log_analytics_workspace.sentinel_workspace.name
  location                        = azurerm_log_analytics_workspace.sentinel_workspace.location
  resource_group_name             = azurerm_resource_group.sentinel_rg.name
  deploy_environment              = "dev"
  enable_solution_soar_essentials = true
}

module "mod_sentinel_automation_rule" {
  #source = "azurenoops/overlays-sentinel/azurerm//modules/automation_rule"  
  #version = "x.x.x"  
  source     = "../../../modules/automation_rule"
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_log_analytics_solution.solutions, module.mod_sentinel_content_hub_solutions]

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
