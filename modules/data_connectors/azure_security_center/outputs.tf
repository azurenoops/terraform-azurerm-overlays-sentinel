# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "data_connector_azure_security_center_id" {
  value = azurerm_sentinel_data_connector_azure_security_center.data_connector_azure_security_center.id
}

output "data_connector_azure_security_center_name" {
  value = azurerm_sentinel_data_connector_azure_security_center.data_connector_azure_security_center.name
}
  