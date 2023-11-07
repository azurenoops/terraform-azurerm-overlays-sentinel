# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY AZURE SENTINEL SCHEDULED ALERT RULES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "azurerm_sentinel_alert_rule_scheduled" "rule" {
  for_each                   = var.scheduled_alert_rules
  display_name               = try(each.value.display_name, null)
  log_analytics_workspace_id = try(each.value.log_analytics_workspace_id, null)

  name                        = try(each.value.name, null)
  query                       = try(each.value.query, null)
  severity                    = try(each.value.severity, null)
  alert_rule_template_guid    = try(lookup(each.value.alert_rule_template_guid, "alert_rule_template_guid"), null)
  alert_rule_template_version = try(lookup(each.value.alert_rule_template_version, "alert_rule_template_version"), null)
  custom_details              = try(lookup(each.value.custom_details, "custom_details"), {})
  description                 = try(lookup(each.value.description, "description"), null)
  enabled                     = try(lookup(each.value.enabled, "enabled"), false)
  suppression_duration        = try(lookup(each.value.suppression_duration, "suppression_duration"), null)
  suppression_enabled         = try(lookup(each.value.suppression_enabled, "suppression_enabled"), false)
  tactics                     = try(lookup(each.value.tactics, "tactics"), [])
  techniques                  = try(lookup(each.value.techniques, "techniques"), [])

  dynamic "alert_details_override" {
    for_each = try(lookup(each.value.alert_details_override, "alert_details_override"), [])
    content {
      description_format   = try(alert_details_override.value, "description_format")
      display_name_format  = try(alert_details_override.value, "display_name_format")
      severity_column_name = try(alert_details_override.value, "severity_column_name")
      tactics_column_name  = try(alert_details_override.value, "tactics_column_name")

      dynamic "dynamic_property" {
        for_each = alert_details_override.value == null ? [] : ["dynamic_property"]
        content {
          name  = try(dynamic_property.value, "name")
          value = try(dynamic_property.value, "value")
        }
      }
    }
  }

  dynamic "entity_mapping" {
    for_each = try(lookup(each.value.entity_mapping, "entity_mapping"), [])
    content {
      entity_type = try(entity_mapping.value, "entity_type")

      dynamic "field_mapping" {
        for_each = try(entity_mapping.value, "field_mapping") == null ? [] : ["field_mapping"]
        content {
          column_name = try(field_mapping.value, "column_name")
          identifier  = try(field_mapping.value, "identifier")
        }
      }
    }
  }

  dynamic "event_grouping" {
    for_each = try(lookup(each.value.event_grouping, "event_grouping"), [])
    content {
      aggregation_method = event_grouping.value["aggregation_method"]
    }
  }

  dynamic "incident_configuration" {
    for_each = try(lookup(each.value.incident_configuration, "incident_configuration"), [])
    content {
      create_incident = try(incident_configuration.value["create_incident"])

      dynamic "grouping" {
        for_each = try(incident_configuration.value["grouping"])
        content {
          enabled                 = grouping.value["enabled"]
          lookback_duration       = grouping.value["lookback_duration"]
          reopen_closed_incidents = grouping.value["reopen_closed_incidents"]
          entity_matching_method  = grouping.value["entity_matching_method"]
          group_by_entities       = grouping.value["group_by_entities"]
          group_by_alert_details  = grouping.value["group_by_alert_details"]
          group_by_custom_details = grouping.value["group_by_custom_details"]
        }
      }
    }
  }

  dynamic "sentinel_entity_mapping" {
    for_each = try(lookup(each.value.sentinel_entity_mapping, "sentinel_entity_mapping"), [])
    content {
      column_name = try(sentinel_entity_mapping.value, "column_name")
    }
  }
}
