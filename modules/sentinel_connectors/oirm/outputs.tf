# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "sentinel_connector_oirm_id" {
  value = azurerm_sentinel_data_connector_office_irm.dataOIRM.id
}

output "sentinel_connector_oirm_name" {
  value = azurerm_sentinel_data_connector_office_irm.dataOIRM.name
}
  