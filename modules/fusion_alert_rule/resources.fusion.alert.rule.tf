# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

################################################
# DEPLOY AZURE SENTINEL SCHEDULED ALERT RULES ##
################################################

resource "azurerm_sentinel_alert_rule_fusion" "sentinel_alert_rule_fusion" {
  name                       = format("%s-%s-%s", element(split("/", var.log_analytics_workspace_id), 8),"SecurityInsights",uuid())
  log_analytics_workspace_id = var.log_analytics_workspace_id
  alert_rule_template_guid   = var.alert_rule_template_guid
  enabled                    = var.enable_rule_alert
}
