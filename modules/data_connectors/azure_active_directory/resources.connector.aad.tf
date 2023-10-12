# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_azure_active_directory" "dataAAD" {
  name                       = "Azure_AD_Connector"
  log_analytics_workspace_id = var.log_analytics_workspace_id
}