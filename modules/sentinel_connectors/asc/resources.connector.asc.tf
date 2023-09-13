# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_azure_security_center" "dataASC" {
  name                       = "Azure_Security_Center_Conector"
  log_analytics_workspace_id = var.log_analytics_workspace_id
}