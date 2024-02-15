# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#######################################################
# DEPLOY AZURE SENTINEL MACHINE LEARNING ALERT RULES ##
#######################################################

resource "azurerm_sentinel_alert_rule_machine_learning_behavior_analytics" "sentinel_alert_rule_machine_learning_behavior_analytics" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  for_each                   = var.machine_learning_alert_rules != null ? var.machine_learning_alert_rules : tomap({})
  name                       = format("%s-%s-%s", element(split("/", azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id), 8), "SecurityInsights", uuid())
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
  alert_rule_template_guid   = each.value.alert_rule_template_guid
  enabled                    = each.value.enabled
}
