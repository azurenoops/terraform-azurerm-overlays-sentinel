# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "id" {
  description = "The ID of the Sentinel Alert Rule Machine Learning Behavior Analytics."
  value       = azurerm_sentinel_alert_rule_machine_learning_behavior_analytics.sentinel_alert_rule_machine_learning_behavior_analytics.id
}
