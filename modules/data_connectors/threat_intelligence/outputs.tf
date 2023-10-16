# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "data_connector_threat_intelligence_id" {
  value = azurerm_sentinel_data_connector_threat_intelligence.data_connector_threat_intelligence.id
}

output "data_connector_threat_intelligence_name" {
  value = azurerm_sentinel_data_connector_threat_intelligence.data_connector_threat_intelligence.name
}
  