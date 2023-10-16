# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_azure_advanced_threat_protection" "data_connector_azure_atp" {
  name                       = "data_connector_azure_atp"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  tenant_id                  = var.tenant_id
}
