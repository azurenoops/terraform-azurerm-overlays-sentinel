# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_office_irm" "dataOIRM" {
  name                       = "OIRM_Connector"
  log_analytics_workspace_id = var.log_analytics_workspace_id
}