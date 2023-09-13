# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "sentinel_connector_opbi_id" {
  value = azurerm_sentinel_data_connector_office_power_bi.dataOPBI.id
}

output "sentinel_connector_opbi_name" {
  value = azurerm_sentinel_data_connector_office_power_bi.dataOPBI.name
}
  