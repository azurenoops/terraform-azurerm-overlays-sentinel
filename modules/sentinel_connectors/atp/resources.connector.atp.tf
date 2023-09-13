# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_azure_advanced_threat_protection" "dataATP" {
  name                       = "ATP_Connector"
  log_analytics_workspace_id = var.log_analytics_workspace_id
}