# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY AZURE SENTINEL SCHEDULED ALERT RULES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "azapi_resource" "ueba_entity" {
  type      = "Microsoft.SecurityInsights/settings@2023-02-01-preview"
  name      = "EntityAnalytics"
  parent_id = data.azurerm_log_analytics_workspace.laws.id

  body = jsonencode({
    kind = "EntityAnalytics"
    properties = {
      entityProviders = var.ueba_entity_providers
    }
  })
}

resource "azapi_resource" "ueba" {
  depends_on = [azapi_resource.ueba_entity]
  
  type      = "Microsoft.SecurityInsights/settings@2023-02-01-preview"
  name      = "Ueba"
  parent_id = data.azurerm_log_analytics_workspace.laws.id

  body = jsonencode({
    kind = "Ueba"
    properties = {
      dataSources = var.ueba_data_sources
    }
  })
}
