# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_dynamics_365" "data_connector_dynamics_365" {
  name                       = "data_connector_dynamics_365"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  tenant_id = var.tenant_id
}