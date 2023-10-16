# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "data_connector_azure_atp_id" {
  value = azurerm_sentinel_data_connector_azure_advanced_threat_protection.data_connector_azure_atp.id
}

output "data_connector_azure_atp_name" {
  value = azurerm_sentinel_data_connector_azure_advanced_threat_protection.data_connector_azure_atp.name
}
  