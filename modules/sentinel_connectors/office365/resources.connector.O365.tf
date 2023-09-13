# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_office_365" "dataO365" {
  name                       = "O365_Connector"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  exchange_enabled           = var.enable_exchange_connector
  teams_enabled              = var.enable_teams_connector
  sharepoint_enabled         = var.enable_sharepoint_connector
}