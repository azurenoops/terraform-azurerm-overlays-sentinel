# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_microsoft_threat_intelligence" "data_connector_microsoft_threat_intelligence" {
  name                                         = "data_connector_microsoft_threat_intelligence"
  log_analytics_workspace_id                   = var.log_analytics_workspace_id
  microsoft_emerging_threat_feed_lookback_date = var.microsoft_emerging_threat_feed_lookback_date
  tenant_id                                    = var.tenant_id
}
