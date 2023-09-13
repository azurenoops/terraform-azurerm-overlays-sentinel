# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "sentinel_connector_atp_id" {
  value = azurerm_sentinel_data_connector_azure_advanced_threat_protection.dataATP.id
}

output "sentinel_connector_atp_name" {
  value = azurerm_sentinel_data_connector_azure_advanced_threat_protection.dataATP.name
}
  