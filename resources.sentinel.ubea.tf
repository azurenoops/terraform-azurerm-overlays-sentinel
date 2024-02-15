# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY AZURE SENTINEL UEBA SETTINGS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "azapi_resource" "ueba_entity" {
  depends_on = [ azurerm_role_assignment.sec_owner, azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  type      = "Microsoft.SecurityInsights/settings@2023-02-01-preview"
  name      = "EntityAnalytics"
  parent_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id

  body = jsonencode({
    kind = "EntityAnalytics"
    properties = {
      entityProviders = var.ueba_entity_providers
    }
  })
}

resource "azapi_resource" "ueba" {
  depends_on = [azapi_resource.ueba_entity, azurerm_sentinel_log_analytics_workspace_onboarding.sentinel]
  
  type      = "Microsoft.SecurityInsights/settings@2023-02-01-preview"
  name      = "Ueba"
  parent_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id

  body = jsonencode({
    kind = "Ueba"
    properties = {
      dataSources = var.ueba_data_sources
    }
  })
}
