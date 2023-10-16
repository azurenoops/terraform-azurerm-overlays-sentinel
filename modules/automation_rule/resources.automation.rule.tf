# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_automation_rule" "sentinel_automation_rule" {

  display_name               = local.automation_rule_object["display_name"]
  log_analytics_workspace_id = var.log_analytics_workspace_id
  name                       = uuidv5("dns", local.automation_rule_object["display_name"])
  order                      = local.automation_rule_object["rule_order"]
  condition_json             = try(jsonencode(local.automation_rule_object["condition_json"]), null)
  triggers_on                = try(local.automation_rule_object["triggers_on"], null)
  triggers_when              = try(local.automation_rule_object["triggers_when"], null)

  // To deprecate in favor of condition_json
  dynamic "condition" {
    for_each = try(local.automation_rule_object["conditions"], [])

    content {
      operator = condition.value["operator"]
      property = condition.value["property"]
      values   = condition.value["values"]
    }
  }

  dynamic "action_playbook" {
    for_each = try(local.automation_rule_object["action_playbooks"], [])

    content {
      order        = action_playbook.value["order"]
      logic_app_id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Logic/workflows/${try(action_playbook.value["prefixed"], false) ? "${var.unique_name_prefix}-${action_playbook.value["logic_app_id"]}-${var.environment}" : action_playbook.value["logic_app_id"]}"
      tenant_id    = try(action_playbook.value["tenant_id"], null)
    }
  }

  dynamic "action_incident" {
    for_each = try(local.automation_rule_object["action_incidents"], [])

    content {
      order                  = action_incident.value["order"]
      status                 = try(action_incident.value["status"], null)
      classification         = try(action_incident.value["classification"], null)
      classification_comment = try(action_incident.value["classification_comment"], null)
      labels                 = try(action_incident.value["labels"], [])
      owner_id               = try(action_incident.value["owner_id"], null)
      severity               = try(action_incident.value["severity"], null)
    }
  }
}