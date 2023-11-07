# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "id" {
  description = "The ID of the alert rule."
  value       = module.mod_sentinel_scheduled_alert_rule.id
}
