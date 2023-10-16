# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "data_connector_microsoft_threat_protection_id" {
  value = azurerm_sentinel_data_connector_microsoft_threat_protection.data_connector_microsoft_threat_protection.id
}

output "data_connector_microsoft_threat_protection_name" {
  value = azurerm_sentinel_data_connector_microsoft_threat_protection.data_connector_microsoft_threat_protection.name
}
  