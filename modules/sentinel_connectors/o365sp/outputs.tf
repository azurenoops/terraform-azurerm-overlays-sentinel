# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "sentinel_connector_o365sp_id" {
  value = azurerm_sentinel_data_connector_office_365_project.dataO365P.id
}

output "sentinel_connector_o365sp_name" {
  value = azurerm_sentinel_data_connector_office_365_project.dataO365P.name
}
  