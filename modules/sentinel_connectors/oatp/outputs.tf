# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "sentinel_connector_oatp_id" {
  value = azurerm_sentinel_data_connector_office_atp.dataOATP.id
}

output "sentinel_connector_oatp_name" {
  value = azurerm_sentinel_data_connector_office_atp.dataOATP.name
}
  