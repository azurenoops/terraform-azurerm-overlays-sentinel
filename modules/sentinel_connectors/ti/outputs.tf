# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "sentinel_connector_ti_id" {
  value = azurerm_sentinel_data_connector_threat_intelligence.dataTI.id
}

output "sentinel_connector_ti_name" {
  value = azurerm_sentinel_data_connector_threat_intelligence.dataTI.name
}
  