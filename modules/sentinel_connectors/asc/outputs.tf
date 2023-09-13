# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "sentinel_connector_asc_id" {
  value = azurerm_sentinel_data_connector_azure_security_center.dataASC.id
}

output "sentinel_connector_asc_name" {
  value = azurerm_sentinel_data_connector_azure_security_center.dataASC.name
}
  