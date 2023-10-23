# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_automation_rule" "automation_rule" {
  display_name               = var.display_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  name                       = uuidv5("dns", var.unique_prefix)
  order                      = var.rule_order
  enabled                    = var.enabled
  expiration                 = var.expiration

  dynamic "condition" {
    for_each = var.conditions

    content {
      operator = condition.value["operator"]
      property = condition.value["property"]
      values   = condition.value["values"]
    }
  }

  action_playbook {
    logic_app_id = var.logic_app_id
    order        = var.action_order
    tenant_id    = try(var.tenant_id, null)
  }
}