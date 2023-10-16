# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "data_connector_office_365_project_id" {
  value = azurerm_sentinel_data_connector_office_365_project.data_connector_office_365_project.id
}

output "data_connector_office_365_project_name" {
  value = azurerm_sentinel_data_connector_office_365_project.data_connector_office_365_project.name
}
  