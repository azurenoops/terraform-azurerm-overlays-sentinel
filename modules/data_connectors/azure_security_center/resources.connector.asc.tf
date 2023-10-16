# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_azure_security_center" "data_connector_azure_security_center" {
  name                       = "data_connector_azure_security_center"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  subscription_id            = var.subscription_id
}