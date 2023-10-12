# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

###########################################################
# DEPLOY AZURE SENTINEL MS SECURITY INCIDENT ALERT RULES ##
###########################################################

resource "azurerm_sentinel_alert_rule_ms_security_incident" "sentinel_alert_rule_ms_security_incident" {
  name                       = "example-ms-security-incident-alert-rule"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  product_filter             = var.product_filter
  display_name               = var.display_name
  severity_filter            = var.severity_filter
  alert_rule_template_guid   = var.alert_rule_template_guid
  description                = var.description
}
