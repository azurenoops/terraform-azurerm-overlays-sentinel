# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_microsoft_threat_protection" "dataMTP" {
  name                       = "MTP_Connector"
  log_analytics_workspace_id = var.log_analytics_workspace_id 
}