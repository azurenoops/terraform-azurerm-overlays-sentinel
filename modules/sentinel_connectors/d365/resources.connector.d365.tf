# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_dynamics_365" "dataD365" {
  name                       = "D365_Connetor"
  log_analytics_workspace_id = var.log_analytics_workspace_id
}