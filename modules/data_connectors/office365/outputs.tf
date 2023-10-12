# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "sentinel_connector_o365_id" {
  value = azurerm_sentinel_data_connector_office_365.dataO365.id
}

output "sentinel_connector_o365_name" {
  value = azurerm_sentinel_data_connector_office_365.dataO365.name
}
  