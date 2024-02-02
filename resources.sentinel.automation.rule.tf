# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_automation_rule" "automation_rule" {
  for_each                   = var.automation_rules != null ? var.automation_rules : tomap({})
  display_name               = try(each.value.display_name, null)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id

  name           = try(each.value.name, null)
  order          = try(lookup(each.value.order, "order"), 1)
  condition_json = try(jsonencode(each.value.condition_json), null)
  enabled        = try(each.value.enabled, false)
  expiration     = try(each.value.expiration, null)
  triggers_on    = try(each.value.triggers_on, null)
  triggers_when  = try(each.value.triggers_when, null)

  dynamic "action_incident" {
    for_each = each.value.action_incident == null ? [] : each.value.action_incident
    content {
      order                  = action_incident.value["order"]
      status                 = action_incident.value["status"]
      classification         = action_incident.value["classification"]
      classification_comment = action_incident.value["classification_comment"]
      labels                 = action_incident.value["labels"]
      owner_id               = action_incident.value["owner_id"]
      severity               = action_incident.value["severity"]
    }
  }

  dynamic "action_playbook" {
    for_each = each.value.action_playbook == null ? [] : each.value.action_playbook
    content {
      logic_app_id = action_playbook.value["logic_app_id"]
      order        = action_playbook.value["order"]
      tenant_id    = action_playbook.value["tenant_id"]
    }
  }
}


