# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "id" {
  description = "The ID of the alert rule."
  value       = flatten([for rule in azurerm_sentinel_alert_rule_scheduled.rule : rule.id])
}