# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

###########################################################
# DEPLOY AZURE SENTINEL MS SECURITY INCIDENT ALERT RULES ##
###########################################################

resource "azurerm_sentinel_alert_rule_ms_security_incident" "sentinel_alert_rule_ms_security_incident" {
  for_each                   = var.ms_security_incident_alert_rules != null ? var.ms_security_incident_alert_rules : tomap({})
  name                       = format("%s-%s-%s", element(split("/", azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id), 8), "SecurityInsights", uuid())
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
  product_filter             = each.value.product_filter
  display_name               = each.value.display_name
  severity_filter            = each.value.severity_filter
  alert_rule_template_guid   = each.value.alert_rule_template_guid
  description                = each.value.description
  enabled                    = each.value.enabled
}
