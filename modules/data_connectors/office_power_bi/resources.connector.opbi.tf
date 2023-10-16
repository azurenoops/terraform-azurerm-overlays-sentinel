# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_office_power_bi" "data_connector_office_power_bi" {
  name                       = "data_connector_office_power_bi"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  tenant_id                  = var.tenant_id
}