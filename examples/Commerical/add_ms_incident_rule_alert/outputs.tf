# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "id" {
  description = "The ID of the alert rule."
  value       = module.mod_sentinel_ms_security_incident_alert_rule.id
}
