# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_microsoft_defender_advanced_threat_protection" "dataDATP" {
  name                       = "DATP_Connector"
  log_analytics_workspace_id = var.log_analytics_workspace_id
}