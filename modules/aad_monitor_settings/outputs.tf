# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "id" {
  value = azurerm_monitor_aad_diagnostic_setting.aad_logs.id
}

output "name" {
  value = azurerm_monitor_aad_diagnostic_setting.aad_logs.name
}

output "log_analytics_workspace_id" {
  value = azurerm_monitor_aad_diagnostic_setting.aad_logs.log_analytics_workspace_id
}

output "storage_account_id" {
  value = azurerm_monitor_aad_diagnostic_setting.aad_logs.storage_account_id
}
