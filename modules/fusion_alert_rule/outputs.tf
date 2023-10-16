# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "id" {
  description = "The ID of the alert rule."
  value       = azurerm_sentinel_alert_rule_fusion.sentinel_alert_rule_fusion.id
}
