# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "sentinel_connector_aad_id" {
  value = azurerm_sentinel_data_connector_azure_active_directory.dataAAD.id
}

output "sentinel_connector_aad_name" {
  value = azurerm_sentinel_data_connector_azure_active_directory.dataAAD.name
}
  