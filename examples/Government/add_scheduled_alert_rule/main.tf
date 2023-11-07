# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "mod_sentinel_scheduled_alert_rule" {
  #source = "azurenoops/overlays-sentinel/azurerm//modules/scheduled_alert_rule"  
  #version = "x.x.x"  
  source     = "../../../modules/scheduled_alert_rule"
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_log_analytics_solution.solutions]

  scheduled_alert_rules = {
    "scheduled_alert_rule1" = {
      display_name               = "Scheduled Alert Rule"
      log_analytics_workspace_id = "${azurerm_log_analytics_workspace.sentinel_workspace.id}"
      name                       = "Scheduled Alert Rule"
      query                      = "SecurityEvent | where EventID == 4625"
      severity                   = "High"
      suppression_duration       = "PT1H"
      suppression_enabled        = true
      tactics                    = ["Persistence"]
      techniques                 = ["Valid Accounts"]
      entity_mapping = [
        {
          entity_type = "Account"
          field_mapping = [
            {
              column_name = "Account"
              identifier  = "Account"
            }
          ]
        }
      ]
      event_grouping = [
        {
          aggregation_method = "Count"
        }
      ]
      incident_configuration = [
        {
          create_incident = true
          grouping = [
            {
              enabled                 = true
              lookback_duration       = "PT1H"
              reopen_closed_incidents = true
              entity_matching_method  = "ByEntities"
              group_by_entities       = ["Account"]
              group_by_alert_details  = ["Account"]
              group_by_custom_details = ["Account"]
            }
          ]
        }
      ]
    }
  }
}
