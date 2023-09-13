# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_microsoft_cloud_app_security" "dataCAS" {
  name                       = "CAS_Connector"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  alerts_enabled             = var.enable_alerts
  discovery_logs_enabled     = var.enable_discovery_logs
}