# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_office_power_bi" "dataOPBI" {
  name                       = "OPBI_Connector"
  log_analytics_workspace_id = var.log_analytics_workspace_id
}