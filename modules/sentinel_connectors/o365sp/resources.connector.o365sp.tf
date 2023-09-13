# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_office_365_project" "dataO365P" {
  name                       = "O365P_Connector"
  log_analytics_workspace_id = var.log_analytics_workspace_id
}