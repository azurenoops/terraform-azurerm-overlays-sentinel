# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_data_connector_microsoft_cloud_app_security" "data_connector_microsoft_cloud_app_security" {
  name                       = "data_connector_microsoft_cloud_app_security"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  alerts_enabled             = var.enable_alerts
  discovery_logs_enabled     = var.enable_discovery_logs
  tenant_id                  = var.tenant_id
}
