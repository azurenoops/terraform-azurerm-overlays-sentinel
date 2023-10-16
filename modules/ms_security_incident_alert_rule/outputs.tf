# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "id" {
  description = "The ID of the alert rule."
  value       = azurerm_sentinel_alert_rule_ms_security_incident.sentinel_alert_rule_ms_security_incident.id
}