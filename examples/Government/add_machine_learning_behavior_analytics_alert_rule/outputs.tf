# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "id" {
  description = "The ID of the alert rule."
  value       = module.mod_sentinel_machine_learning_behavior_analytics_alert_rule.id
}