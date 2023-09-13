# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_threat_intelligence" "dataTI" {
  name                       = "TI_Connector"
  log_analytics_workspace_id = var.log_analytics_workspace_id
}