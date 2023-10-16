# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_threat_intelligence" "data_connector_threat_intelligence" {
  name                       = "data_connector_threat_intelligence"
  log_analytics_workspace_id = var.log_analytics_workspace_id
   tenant_id                  = var.tenant_id
}