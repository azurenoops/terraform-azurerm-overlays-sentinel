# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "sentinel_connector_cas_id" {
  value = azurerm_sentinel_data_connector_microsoft_cloud_app_security.dataCAS.id
}

output "sentinel_connector_cas_name" {
  value = azurerm_sentinel_data_connector_microsoft_cloud_app_security.dataCAS.name
}
  