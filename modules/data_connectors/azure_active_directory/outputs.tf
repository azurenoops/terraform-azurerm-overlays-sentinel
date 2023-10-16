# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "data_connector_azure_ad_id" {
  value = azurerm_sentinel_data_connector_azure_active_directory.data_connector_azure_ad.id
}

output "data_connector_azure_ad_name" {
  value = azurerm_sentinel_data_connector_azure_active_directory.data_connector_azure_ad.name
}
  