# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_office_365" "data_connector_office_365" {
  name                       = "data_connector_office_365"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  exchange_enabled           = var.enable_exchange_connector
  teams_enabled              = var.enable_teams_connector
  sharepoint_enabled         = var.enable_sharepoint_connector
  tenant_id                  = var.tenant_id
}