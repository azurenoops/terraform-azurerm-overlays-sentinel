# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "sentinel_connector_d365_id" {
  value = azurerm_sentinel_data_connector_dynamics_365.dataD365.id
}

output "sentinel_connector_d365_name" {
  value = azurerm_sentinel_data_connector_dynamics_365.dataD365.name
}
  