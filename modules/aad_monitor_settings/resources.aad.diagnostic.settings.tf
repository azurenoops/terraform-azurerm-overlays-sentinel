# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Enable Azure Active Directory Diagnostic Settings in Sentinel
resource "azurerm_monitor_aad_diagnostic_setting" "aad_logs" {
  name                       = "Export-Logs-To-Sentinel"
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.laws.id

  dynamic "enabled_log" {
    for_each = toset(var.data_connector_aad_logs)
    content {
      category = enabled_log.key
      retention_policy {
        enabled = true
        days    = var.retention_policy_days
      }
    }
  }
}
