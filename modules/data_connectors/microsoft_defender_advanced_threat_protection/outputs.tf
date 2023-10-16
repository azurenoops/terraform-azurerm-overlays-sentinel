# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "data_connector_microsoft_defender_atp_id" {
  value = azurerm_sentinel_data_connector_microsoft_defender_advanced_threat_protection.data_connector_microsoft_defender_atp.id
}

output "data_connector_microsoft_defender_atp_name" {
  value = azurerm_sentinel_data_connector_microsoft_defender_advanced_threat_protection.data_connector_microsoft_defender_atp.name
}
  